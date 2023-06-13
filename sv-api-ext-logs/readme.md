### Virtual Service for Accessing Server Log Files

Base URI: sv-api-ext/log/

Log types:
   * server
   * svm
   * license-utility

Available operations:

   * GET *\{log-type\}/view* - view a log file
   * GET *\{log-type\}/view/\{log-suffix\}* - view a log file with particular log suffix - useful for viewing older rotated log files
   * GET *\{log-type\}/zip* - zips a log file
   * GET *\{log-type\}/zip/\{log-suffix\}* - zips rotated log file
   * GET *zip-all* - zips whole log folder
   * GET *delete-all* - deletes all files from log folder (currently used log files will not be deleted as they are in use)
   
Example:

http://localhost:6070/sv-api-ext/log/server/view