€<?php 
$string = "";
class Validation
{


	//test
	function test(){
    
    	echo "testba";

	}

	//it checks if date is current date or not
	function currentDate($date)
	{

		$todayDate = strtotime(date("d F, Y"));
		$enteredDate = strtotime($date);
		if($todayDate != $enteredDate)
		{
			echo "Please enter todays date.";
			// return false;
		}
		
	}

	//for payout grid ->

	function wef_end($wef, $end_date)
	{
		$dateTimestamp1 = strtotime($wef);
		$dateTimestamp2 = strtotime($end_date);
		$diff= $dateTimestamp1-$dateTimestamp2;
		//echo $diff;
		if ($diff<0)
		   {
		     return true;
		   }
		   else
		   {
		   	return false;
		   }
	}

	//checks if the date is back date
	function isBackDate($date)
	{
		$todayDate = strtotime(date("d F, Y"));
		$enteredDate = strtotime($date);

		if( $enteredDate >= $todayDate)
		{
			return true;
			// return true;
		}
		
	}

	//checks if the given string contains only Numbers.
	function isNumeric($num)
	{
		if(!is_numeric($num))
		{
			 return false;
		}
		else{
			return true;
		}
		
	}

	//checks if the given string contains only alphabets.
	function isAlphabets($string)
	{
		if(!preg_match ('/^([a-zA-Z]+[ a-zA-Z]+)$/', $string))
		{
			//echo "Please enter only characters";
			return false;
		}
		else
		{
			return true;
		}
	}

	//checks if the string contains alphanumeric characters.
	function isAlphaNumeric($string)
	{

		
		if(!preg_match ('/^([a-zA-Z0-9]+[a-zA-Z0-9 ]+)$/', $string))
		{
			//echo "Please enter only Alphanumeric characters";
			 return false;
		}
		else{

			return true;
		}
		
	}

	//restricts the size to 10 characters
	function size3($string)
	{

		if(strlen($string) > 3)
		{
			//echo "Please do not enter more than 3 characters";
			 return false;
		}
		else{
			return true;
		}
	}


	function size10($string)
	{

		if(strlen($string) > 10)
		{
			//echo "Please do not enter more than 10 characters";
			 return false;
		}
		else{
			return true;
		}
	}

	//restricts the size to 15 characters
	function size15($string)
	{

		if(strlen($string) > 15)
		{
			//echo "Please do not enter more than 15 characters";
			 return false;
		}
		else{
			return true;
		}
	}

	function size20($string)
	{

		if(strlen($string) > 20)
		{
			//echo "Please do not enter more than 20 characters";
			 return false;
		}
		else{
			return true;
		}
	}

	//restricts the size to 50 characters
	function size50($string)
	{

		if(strlen($string) > 50)
		{
			//echo "fail";
			return false;
		}
		else{
			//echo "pass";
			return true;
		}
	}

	function size100($string)
	{

		if(strlen($string) > 100)
		{
			//echo "fail";
			return false;
		}
		else{
			//echo "pass";
			return true;
		}
	}

	//restricts the size to 255 characters
	function size255($string)
	{

		if(strlen($string) > 255)
		{
			return false;
		}
		else
		{
			return true;
		}
	}

	function size5000($string)
	{

		if(strlen($string) > 5000)
		{
			return false;
		}
		else
		{
			return true;
		}
	}

	//uppercase the first character of each word 
	function capFirstChar($string)
	{
		return ucwords($string);
	}

	function email_id($string)
	{
		$pattern = "/^[a-z]+[_a-z0-9-]+(\.[a-z]+[_a-z0-9-]+)*@([a-z0-9-]{1,25})+(\.[a-z0-9-]+)*(\.[a-z]{2,5})$/";
		if (!preg_match($pattern, $string))
		{ 
			//echo "Please enter valid email address."; 
			return false;
		}  
		else
		{
			return true;
		}
	} 

	function notEmpty($string)
	{
		if(preg_match('/^[\s]$/', $string) || $string == "" || $string == null)
		{
			//echo "Dont leave any field empty.";
			return false;
		}
		else
		{
			return true;
		}
	}

	//for % related fields. e.g. payout grid. 
	function decimalNum($num)
	{
		if(preg_match('/^[0-9]{1,2}+(\.[0-9]{1,2})?$/', $num))
		{
			return true;
		}
		else
		{
			return false;
		}

	}

	function faxNo($num)
	{
		if(strlen($num) > 11)
		{
			// echo "Please enter valid fax number";
			return true;
		}
		else{
			return false;
		}
	}

	function landLine($num)
	{
		if(strlen($num) >= 11)
		{
			// echo "Please enter valid landline number";
			return true;
		}
		else{
			return false;
		}
	}

	function pinCode($num)
	{
		if(strlen($num) > 9)
		{
			// echo "Please enter valid pincode number";
			return true;
		}
		else{
			return false;
		}
	}

	function docType($filename)
	{
		$arrayExt = array("doc", "pdf", "xls", "docx", "jpg","jpeg", "png", "txt", "xml", "odt");
		//$arrayExt = array("JPG");
		$doctype = explode(".",$filename);
		$docTypeLength = sizeof($doctype);
		if(!in_array(strtolower($doctype[$docTypeLength-1]), $arrayExt))
		{
			return false;
		}
		else
		{
			return true;
		}

	}

	function mobileNum($num)
	{
		if(preg_match('/^((\+){0,1}([0-9]{2,4})(\s){0,1})?([0-9]{8,15})$/', $num))
		{
			return true;
		}
		else
		{
			return false;
		}
	}

	function checkPassword($string)
	{
		$pattern = "$\S*(?=\S{8,})(?=\S*[a-z])(?=\S*[A-Z])(?=\S*[\d])(?=\S*[\W])\S*$";
		if(preg_match($pattern , $string))
		{
			return true;
		}
		else 
		{
			return false;
		}

	}

	function forRemarks()
	{
		$pattern = "/^[(a-zA-Z0-9-)]$/";
		if(preg_match($pattern , $string))
		{
			return true;
		}
		else 
		{
			return false;
		}

	}


	//NEEL'S FUNCTION
	 
	/*

		*The function public function validateText() will be handling the validation of the text. Using this function you 	can spcify what type of validation you need to apply on your string
		*The parameters of the function are as below:

			1. $string: Contains the string that is to be validated.

			2. $onlyAlpha (boolean) values(0 or 1): Set the parameter to 1 if and only if the string must contain 	   only alphabets else set it to 0. If any other (boolean) parameter is been set to 1 w.r.t to this parameter 	 then the function will not give desired output.

			3. $onlyNumeric (boolean) values(0 or 1): Set the parameter to 1 if and only if the string must contain 	only numeric characters else set it to 0. If any other (boolean) parameter is been set to 1 w.r.t to this parameter then the function will not give desired output.

			4. $alphaNumeric (boolean) values( 0 or 1): Set the parameter to 1 if you want your string to contain alphabets as well as numeric characters else set it to 0.

			5. $specialChars (boolean) values(0 or 1): Set the parameter to 1 if you want your string to contain special characters else set it to 0.

			6. $exceptionChars (array) values(numeric array): Pass a normal numeric array containing the characters that must not be allowed even though you have allowed their type by setting value to 1 in any of above boolean parameters.

			7. $allowedChars (array) values(numeric array): Pass a normal numeric array containing the characters that must be allowed even though you have not allowed their type by setting value to 0 in any of above boolean parameters.

		* Do not enter empty string.

		* Example of function:
			validateText('hello', 1, 0, 0, 0)			->				will only allow alphabets
			validateText('123', 0, 1, 0, 0)				->				will only allow numbers
			validateText('hello123', 0, 0, 1, 0)		->				will only allow numbers as well as alphabets
			validateText('hello123!@#$', 0, 0, 1, 1)    ->				will only allow special characters
			validateText('hello123_!@#$_%', 0, 0, 1, 1, array('%'))  -> will only allow special characters except %
			validateText('hello%', 0, 0, 1, 1, array(), array('%'))  -> will only not allow special characters except %

	*/



	

	public function validateText($string, $onlyAlpha, $onlyNumeric, $alphaNumeric, $specialChars, $exceptionChars=array(), $allowedChars=array()){

		// echo $string . "<br />";


		//if(strlen($string) === 0)
			//return 0;

		$validateArr = array();

		if($onlyAlpha){
			if(!$onlyNumeric && !$alphaNumeric){
				for($char = 97; $char < 123; $char++)
					array_push($validateArr, chr($char));
			}
		}

		if($onlyNumeric){
			if(!$onlyAlpha && !$alphaNumeric){
				for($num = 48; $num < 58; $num++)
					array_push($validateArr, chr($num));
			}
		}

		if($alphaNumeric){
			for($char = 97; $char < 123; $char++)
				array_push($validateArr, chr($char));

			for($num = 48; $num < 58; $num++)
				array_push($validateArr, chr($num));
		}

		if($specialChars){
			$specialChars_ARR = array('!','@','#','$','%','^','&','*','(',')','_','-','=','+','`','~','[',']','{','}',';',':','\'','"',',','<','.','>','/','?','\\','|',' ');
			foreach ($specialChars_ARR as $chars) {
				array_push($validateArr, $chars);
			}
		}

		if(count($exceptionChars) > 0){
			foreach ($exceptionChars as $value) {
				if(in_array($value, $validateArr))
					unset($validateArr[array_search($value, $validateArr)]);
			}
		}

		if(count($allowedChars) > 0){
			foreach ($allowedChars as $chars) {
				array_push($validateArr, $chars);
			}
		}
		// print_r(array_diff(str_split(strtolower($string)), $validateArr));
		//$flag = 1; //1 - > no error
		if(count(array_diff(str_split(strtolower($string)), $validateArr)) > 0){
			//$flag = 0;  //0 -> error
		// echo $flag;


			//echo "false";
		return false;
		}
		else{
		//echo "true";	
		return true;	
		}

	}

}

$validation = new Validation();
?>