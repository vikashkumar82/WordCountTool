<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebPageCounter.aspx.cs" Inherits="WordCountTool.WebPageCounter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title></title>
    <script>
        function updateCharacterDensity() {
            var inputText = $('#txtInput').val();
            var characterFrequency = {};

            // Calculate character frequency
            for (var i = 0; i < inputText.length; i++) {
                var char = inputText[i];
                if (!/\s/.test(char)) { // Exclude whitespace characters
                    characterFrequency[char] = (characterFrequency[char] || 0) + 1;
                }
            }

            // Display character density
            var result = "";
            for (var key in characterFrequency) {
                result += "Character '" + key + "': " + characterFrequency[key] + " times<br>";
            }
            $('#lblCharacterDensity').html(result);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <textarea id="txtInput" rows="6" oninput="updateCharacterDensity()"></textarea>
        <div id="lblCharacterDensity"></div>
        </div>
    </form>
</body>
</html>
