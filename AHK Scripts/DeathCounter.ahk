;Enter your TXT file path:
filePath = C:\Users\Nate\Documents\Streaming\bgdeaths.txt

;Label before the number, make an empty string to just have a bare number:
label := "TPKs: "

FileReadLine, spoopString, %filePath%, 1

;When you press Numpad + it will increment and update the death counter in the .txt
	NumpadAdd::
		;Creates txt file with a count of 0 which is incremented to 1 if it doesn't exist.
		IfNotExist, %filePath%
		{
			FileAppend, 0, %filePath%
			spoopCount := 0
		}
		;Created a file.
		;Inputs number of spoops in spoopCount variable.
		FileReadLine, spoopString, %filePath%, 1
		spoopCount:= SubStr(spoopString, StrLen(label))
		spoopCount++
		FileDelete, %filePath%
		FileAppend, %label%%spoopCount%, %filePath%
	return

;When you press Numpad - it will decrement and update the death counter in the .txt
	NumpadSub::
		;Inputs number of spoops in spoopCount variable.
		FileReadLine, spoopString, %filePath%, 1
		spoopCount:= SubStr(spoopString, StrLen(label))

		;Don't go below 0
		if(spoopCount = 0)
			return

		spoopCount--
		FileDelete, %filePath%
		FileAppend, %label%%spoopCount%, %filePath%
	return