# Virtual Service for Accessing Server Log Files

## Prerequisites

It works out of the box on Linux, but on Windows you need to add `System.IO.Compression.ZipFile,System.IO.Compression.FileSystem` to `ReferenceAssemblies` in a file `%SERVER-INSTALL-FOLDER%/bin/Config/scripted-rule-context.xml`

So it would look similar to this:
`<property name="ReferenceAssemblies" value="Newtonsoft.Json,NPOI,NPOI.OOXML,NPOI.OpenXml4Net,NPOI.OpenXmlFormats,System.IO.Compression,Npgsql,System.IO.Compression.ZipFile,System.IO.Compression.FileSystem" />`

## Usage

The virtual service is supposed to be deployed on SV Server. Preferrably on its own agent to signify it does not belong to regular production virtual services.

Base URI: `sv-api-ext/log/`

Log types:
   * server
   * svm
   * license-utility

Available operations:

   * GET `{log-type}/view` - view a log file
   * GET `{log-type}/view/{log-suffix}` - view a log file with particular log suffix - useful for viewing older rotated log files
   * GET `{log-type}/zip` - zips a log file
   * GET `{log-type}/zip/{log-suffix}` - zips rotated log file
   * GET `list` - lists all the files inthe log folder with size and creation date
   * GET `zip-all` - zips whole log folder
   * GET `delete-all` - deletes all files from log folder (currently used log files will not be deleted as they are in use)
   
Example:

http://localhost:6070/sv-api-ext/log/server/view

## Changelog

2023-06-05
   * Entering wrong path now shows help
   * Fixed SVM log access on Linux
   * Updated prerequisites doc 

2023-06-13
Initial version
