<?php
	/*
		Name: File Upload Abuse.
		Version: 1.0.
		Author: Neel Dedhia
		Description: This program will keep your server safe from getting harmful file uploaded to 				 your server. If the client to trying to put any harmful and if it is detected 				 by our system then the client will automatically e blacklisted and can also be 			 permanently blocked if client tries it for 3 times.
		How to use: Their are several function defined of which only 3 functions are to be used the 				programmer using this api. The function are: 
					1. public  setFileConstraints($size, $type): 
						this function will set the programmer-defined constraints for file uploads,
						programmer can decide the max size limit of the file, and also which  all types it must allow to get uploaded, [NOTICE: php.ini has its own file size limit of upto 2MB default.].
					2. public  function setUploadPath($path):
					 	this function is used to set the path where the programmer wants to store the file.
					3.public  function uploadFile($usrFile):
						this is the main function where the programer will pass the actual file in the parameter and after through several security checks and decides whether to upload the file or not. 


	*/

	class FileUploadAbuse{
		private $file,$uploadPath, $harmfulExts;
 
		public  function setFileConstraints($size, $type){
			global $file,$harmfulExts;
			$file = array('size' => $size*10,'ext' => $type);
			$harmfulExts = "bat,exe,cmd,sh,php,pl,cgi,386,dll,com,torrent,js,app,jar,pif,vb,vbscript,wsf,asp,cer,csr,jsp,drv,sys,ade,adp,bas,chm,cpl,crt,csh,fxp,hlp,hta,inf,ins,isp,jse,htaccess,htpasswd,ksh,lnk,mdb,mde,mdt,mdw,msc,msi,msp,mst,ops,pcd,prg,reg,scr,sct,shb,shs,url,vbe,vbs,wsc,wsf,wsh,ws,xls,doc";
		}

		public  function setUploadPath($path){
			global $uploadPath;
			$uploadPath = $path;
		}

		private function filePermissions($file) {
			// fileperms returns a numeric value
			$numeric_perms = fileperms($file);
			// but we are used to seeing the octal value
			$octal_perms = sprintf('%o', $numeric_perms);
			return substr($octal_perms, -4);
		}

		private function fileUploadError($errorNum){
			$uploadErrors = array(
				UPLOAD_ERR_OK 				=> "No errors.",
				UPLOAD_ERR_INI_SIZE  	=> "Larger than upload_max_filesize.",
				UPLOAD_ERR_PARTIAL 		=> "Partial upload.",
				UPLOAD_ERR_NO_FILE 		=> "No file.",
				UPLOAD_ERR_NO_TMP_DIR => "No temporary directory.",
				UPLOAD_ERR_EXTENSION 	=> "File upload stopped by extension."
			);
			return $uploadErrors[$errorNum];
		}

		private function sanitizeFileName($fileName){
			// Remove characters that could alter file path.
			// "." is allowed (e.g. "photo.jpg") but ".." is not.
			$filename = preg_replace("/([^A-Za-z0-9_\-\.]|[\.]{2})/", "", $fileName);
			// basename() ensures a file name and not a path
			$filename = basename($filename);
		
			return $filename;
		}

		public function fileExtension($file) {
			$path_parts = pathinfo($file);
			// print_r($path_parts);
			return $path_parts['extension'];
		}

		private function isFileHarmful($ext){
			global $harmfulExts, $file;
			if(stristr($harmfulExts,$ext)){
				if(stristr($file['ext'], $ext)){
					// echo "hai";
					return false;
				}
				else{
					// echo "nai hai";
					return true;
				}
			}else {
				return false;
			}
		}

		private function setNewFileName($uploadPath, $usrfileName, $usrFileExt){
			/*$counterFile = fopen("counterFile.txt", "r");
			$counter = fread($counterFile, filesize("counterFile.txt"));
			$newFileName = rtrim(pathinfo($usrfileName, PATHINFO_BASENAME), $usrFileExt);
			$newFileName .="_" . ++$counter;
			// echo $newFileName; 
			fclose($counterFile);
			$counterFile = fopen("counterFile.txt", "w");
			fwrite($counterFile, $counter);
			fclose($counterFile);
*/
			return $uploadPath . $usrfileName;
		}

		public  function uploadFile($usrFile){
			// $priority = BlacklistIP::isCLientBlacklisted();
			global $file, $uploadPath;
			// print_r($usrFile);
			$fileName = self::sanitizeFileName($usrFile['name']);
			$fileExt = self::fileExtension($usrFile['name']);
			$fileType = $usrFile['type'];
			$error = $usrFile['error'];
			$fileSize = $usrFile['size'];

			$fileUploadPath = self::setNewFileName($uploadPath, $fileName, $fileExt);

			// echo $fileUploadPath;
			$usrError = false;
			$usrErrorContent = "";

			if ($error > 0) {
				$usrError = true;
				$usrErrorContent = "Error: " . self::fileUploadError($error);
			} elseif($fileSize > $file['size']) {
				$usrError = true;
				$usrErrorContent = "Uploading File was exceeding the specified size limit.";
			} elseif(!stristr($file['ext'],$fileExt)) {
				$usrError = true;
				if(self::isFileHarmful($fileExt)){
					// BlacklistIP::blacklistClient('FILE_UPLOAD_ABUSE');
					/*if($priority == false){
						$priority=0;
					}*/
				} 
				$usrErrorContent = "Your file won't be uploaded because of invalid fileType found.";
			} else {
					
				if(move_uploaded_file($usrFile['tmp_name'], $fileUploadPath)){
					// echo "File moved to: $fileUploadPath <br />";
						// remove execute file permissions from the file
					if(chmod($fileUploadPath, 0644)) {
						// echo "Execute permissions removed from file.<br />";
						$file_permissions = self::filePermissions($fileUploadPath);
						// echo "File permissions are now $file_permissions.<br />";
					} else {
						// echo "Error: Execute permissions could not be removed.<br />";
					}
				}
				return true;
			}
			// if($usrError){
					// session_start();
					// $_SESSION['id'] = $_SERVER['REMOTE_ADDR'];
					// $_SESSION['err'] = $usrErrorContent;
					// $_SESSION['priority'] = ++$priority;
					// header('Location: warningPage.php');

			// }
		} 
	}
?>