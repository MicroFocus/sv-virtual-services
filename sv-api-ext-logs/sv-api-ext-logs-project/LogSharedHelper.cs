using HP.SV.CSharp;
using HP.SV.DotNetRuleApi;
using System;
using System.Collections.Generic;
using System.IO;
using System.IO.Compression;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;

namespace HP.SV {
    public static class LogSharedHelper {
        private static string ServerLogFolderWindows = @"c:\ProgramData\Micro Focus\Service Virtualization Server\logs";
        private static string ServerLogFolderLinux = "/opt/microfocus/sv-server/logs/server";
        public static string ServerLogFilename = "HP.SV.StandaloneServer.log";
        public static string SvmLogFilename = "HP.SV.ServiceVirtualizationManagement.log";
        public static string LicenseUtilityLogFilename = "LicenseUtility.log";

        public enum LogType {
            Server,
            Svm,
            LicenseUtility
        }

        static Dictionary<string, string> LogTypeMap = new Dictionary<string, string> {
            { "server", "Server" },
            { "svm", "Svm" },
            { "license-utility", "LicenseUtility" }
        };

        public static LogType GetLogType(string logTypeUriValue) {
            string enumStringValue;
            if (!LogTypeMap.TryGetValue(logTypeUriValue, out enumStringValue)) {
                throw new ArgumentException("Wrong log type. Supported values are: " + string.Join(",", LogTypeMap.Keys.ToArray()));
            }
            LogType logType = (LogType)Enum.Parse(typeof(LogType), enumStringValue, true);
            return logType;
        }

        public static string GetContentAsString(string path) {
            using (FileStream stream = File.Open(path, FileMode.Open, FileAccess.Read, FileShare.ReadWrite)) {
                using (var sr = new StreamReader(stream, Encoding.UTF8)) {
                    return sr.ReadToEnd();
                }
            }
        }

        public static byte[] GetFileContentAsBytes(string path) {
            // cannot use simple File.ReadAllBytes(path); as I was getting "The process cannot access the file because it is being used by another process."
            byte[] buffer = null;
            using (FileStream fs = new FileStream(path, FileMode.Open, FileAccess.Read, FileShare.ReadWrite)) {
                using (BinaryReader br = new BinaryReader(fs)) {
                    long numBytes = new FileInfo(path).Length;
                    buffer = br.ReadBytes((int)numBytes);
                }
            }
            return buffer;
        }

        // TODO: gzipping does not work yet
        public static byte[] GetFileContentAsGzippedBytes(string path) {
            using (FileStream originalFileStream = File.Open(path, FileMode.Open, FileAccess.Read, FileShare.ReadWrite)) {
                using (MemoryStream compressedStream = new MemoryStream()) {
                    using (GZipStream compressor = new GZipStream(compressedStream, CompressionMode.Compress)) {
                        originalFileStream.CopyTo(compressor);
                    }
                    compressedStream.Flush();
                    return compressedStream.ToArray();
                }
            }
        }

        public static string GetLogFolder() {
            return RuntimeInformation.IsOSPlatform(OSPlatform.Linux) ? ServerLogFolderLinux : ServerLogFolderWindows;
        }

        public static string GetLogPath(LogType logType) {
            string logFolder = GetLogFolder();

            string logFile = "UNKNOWN";
            switch (logType) {
                case LogType.Server:
                    logFile = ServerLogFilename;
                    break;
                case LogType.Svm:
                    logFile = SvmLogFilename;
                    break;
                case LogType.LicenseUtility:
                    logFile = LicenseUtilityLogFilename;
                    break;
            }
            return Path.Combine(logFolder, logFile);
        }

        public static string GetRotatedLogPath(LogType logType, string suffix) {
            string regularLogFilePath = GetLogPath(logType);
            return regularLogFilePath + '.' + suffix;
        }

        public static void PopulateViewResponse(HpsvRootObject sv, string logFilePath) {
            byte[] binaryData = new byte[0];
            long statusCode = 500;
            if (File.Exists(logFilePath)) {
                binaryData = GetFileContentAsBytes(logFilePath);

                //sv.GetOrCreate(x => x.Response.HTTPOutputParameters.Headers).Content_Encoding = "gzip";
                sv.GetOrCreate(x => x.Response.HTTPOutputParameters.Headers).Content_Encoding = null;

                //binaryData = Encoding.UTF8.GetBytes(logContent);
                statusCode = 200;
            } else {
                binaryData = Encoding.UTF8.GetBytes($"There is no log file {logFilePath}");

                sv.GetOrCreate(x => x.Response.HTTPOutputParameters.Headers).Content_Encoding = null;

                statusCode = 404;
            }

            sv.Response.Type = "BinaryContent";
            sv.GetOrCreate(x => x.Response.BinaryContent).Data = Convert.ToBase64String(binaryData);
            sv.GetOrCreate(x => x.Response.HTTPOutputParameters.Headers).Content_Type = "text/plain";
            sv.Response.HTTPOutputParameters.StatusCode = statusCode;


        }
    }
}