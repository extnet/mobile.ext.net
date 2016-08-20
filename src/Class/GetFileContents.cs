using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Ext.Net.Examples.Mobile.Class
{
    public class GetFileContents
    {
        private static readonly List<string> allowedExtensionList = new List<string>
        {
            "ascx",
            "ashx",
            "aspx",
            "cs",
            "cshtml",
            "css",
            "js",
            "txt",
            "md"
        };

        public static string JsAndHTMLFriendly(string fileName)
        {
            string contents = null;
            var basePath = AppDomain.CurrentDomain.BaseDirectory;
            var fullPath = basePath + fileName.Replace('/', '\\');

            if (File.Exists(fullPath))
            {
                // Resolves the path to an absolute path (if user specified '../' for example)
                fullPath = Path.GetFullPath(fullPath);
                
                // Checks whether the file is under AppDomain's base path
                if (fullPath.StartsWith(basePath))
                {
                    // Checks against forbidden file extensions:
                    var fext = Path.GetExtension(fullPath);

                    if (fext.Length > 1)
                    {
                        fext = fext.Substring(1); // remove the heading dot

                        var allowedExtension = false;
                        foreach (var vext in allowedExtensionList)
                        {
                            if (vext == fext)
                            {
                                allowedExtension = true;
                                break;
                            }
                        }

                        if (allowedExtension)
                        {
                            contents = File.ReadAllText(fullPath, System.Text.Encoding.UTF8);
                        }
                        else
                        {
                            throw new Exception("File extension '" + fext + "' is not allowed.");
                        }
                    }
                    else
                    {
                        throw new Exception("File name must precede an extension.");
                    }
                }
                else
                {
                    throw new Exception("Unable to fetch content of files outside of APPDomain. Path: " + fullPath);
                }
            }

            return contents;
        }
    }
}