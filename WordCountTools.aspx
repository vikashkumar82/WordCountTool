<<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WordCountTools.aspx.cs" Inherits="WordCountTool.WordCountTools" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Css/StyleSheet.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
    <script src="https://kit.fontawesome.com/a21ed19279.js" crossorigin="anonymous"></script>

    <title>Word Count</title>
    <script type="text/javascript">
        function updateCounts() {
            var inputText = document.getElementById('<%= txtInput.ClientID %>').value;

            // Word count
            var wordCount = inputText.split(/\s+/).filter(function (word) {
                return word.length > 0;
            }).length;

            // Character count
            var charCount = inputText.length;

            // Sentence count (assuming that a sentence ends with a period, question mark, or exclamation point)
            var sentenceCount = inputText.split(/[.!?]+/).filter(function (sentence) {
                return sentence.length > 0;
            }).length;

            // Paragraph count (assuming that paragraphs are separated by two or more line breaks)
            var paragraphCount = inputText.split(/\n\s*\n/).filter(function (paragraph) {
                return paragraph.length > 0;
            }).length;

            // Update the labels
            document.getElementById('<%= lblWordCount.ClientID %>').innerText = wordCount;
           <%-- document.getElementById('<%= lblWordCountBottom.ClientID %>').innerText = wordCount;--%>
            document.getElementById('<%= words.ClientID %>').innerText = wordCount;
            document.getElementById('<%= lblChar.ClientID %>').innerText = charCount;
            <%--document.getElementById('<%= lblCharBottom.ClientID %>').innerText = charCount;--%>
            document.getElementById('<%= character.ClientID %>').innerText = charCount;
            document.getElementById('<%= sentences.ClientID %>').innerText = sentenceCount;
            document.getElementById('<%= paragraphs.ClientID %>').innerText = paragraphCount;

            //Facebook
            var initialCount = 250;
            var currentLength = inputText.length;
            var remainingCount = initialCount - currentLength;
            document.getElementById('faceBook').innerText = remainingCount;
            document.getElementById('twitter').innerText = remainingCount;

            //Character Count


        }


        var text = document.getElementById('<%= txtInput.ClientID %>').value;
        localStorage.setItem('name', text);

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
        <div class="container wordCount-hero">
            <div class="row">
                <div class="col-md-9">
                    <div class="leftSection-wordCount-tool mt-3">
                        <h1 style="text-align: center; color: red">Word Count</h1>
                        <h6 style="text-align: center; color: #6C757D;">(A simple and free word counter and character counter)</h6>
                        <div class="leftSection-countTool ">
                            <div class="leftSection-result">
                                <div class="leftSection-result-word">
                                    <h1>
                                        <asp:Label ID="lblWordCount" runat="server" Text="0"></asp:Label>
                                        Words</h1>
                                </div>
                                <div class="leftSection-result-character">
                                    <h1>
                                        <asp:Label ID="lblChar" runat="server" Text="0"></asp:Label>
                                        Characters</h1>
                                </div>
                            </div>
                            <div class="leftSection-tools p-1">

                                <div class="tools-clear tool-box">
                                    <asp:Button ID="btn_clear" runat="server" Text="Clear" class="btn btn-outline-danger" OnClick="btn_clear_Click" />
                                </div>
                            </div>
                            <div class="leftSection-textarea">
                                <asp:TextBox ID="txtInput" runat="server" TextMode="MultiLine" Rows="10" CssClass="form-control" oninput="updateCounts()"></asp:TextBox>
                            </div>
                            <div class="leftSection-bottomResult p-1 mr-auto">
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="row">
                                            <div class="col-md-9">
                                                <span>&nbsp;Words</span>
                                            </div>
                                            <div class="col-md-3">
                                                <span class="badge rounded-pill text-bg-secondary">
                                                    <asp:Label ID="words" runat="server" Text="0"></asp:Label></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <span>&nbsp;Characters</span>
                                            </div>
                                            <div class="col-md-4">
                                                <span class="badge rounded-pill text-bg-secondary">
                                                    <asp:Label ID="character" runat="server" Text="0"></asp:Label></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <span>&nbsp;Sentence</span>
                                            </div>
                                            <div class="col-md-4">
                                                <span class="badge rounded-pill text-bg-secondary">
                                                    <asp:Label ID="sentences" runat="server" Text="0"></asp:Label></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <span>&nbsp;Paragraphs</span>
                                            </div>
                                            <div class="col-md-4">
                                                <span class="badge rounded-pill text-bg-secondary">
                                                    <asp:Label ID="paragraphs" runat="server" Text="0"></asp:Label></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="leftSection-toolDetails mt-5 p-4">
                        <h1 style="color: #424D61;">What is WordCounter?</h1>
                        <p style="color: #424D61;">
                            Our online editor offers more than just counting words and characters. It goes beyond by assisting you in enhancing your word choice and writing style, and optionally, identifying grammar errors and plagiarism. To check word count, simply input your text, and as you type, delete, or edit, you'll see the characters and words adjust accordingly. You can also easily copy and paste text from other programs. The Auto-Save feature ensures you won't lose any changes, even if you leave and return later. Consider bookmarking this page for quick access.<br />
                            <strong>Tip: Bookmark this page now.</strong>
                        </p>
                        <p style="color: #424D61;">
                            Word count is crucial in various scenarios, such as meeting specific requirements for articles, essays, reports, stories, books, or papers. WordCounter helps ensure your text aligns with the specified limits.
                        </p>
                        <p style="color: #424D61;">
                            Moreover, WordCounter provides insights into the top 10 keywords and their density in your article. This helps you manage keyword usage and distribution, preventing excessive repetition and ensuring optimal keyword placement.
                        </p>
                        <p style="color: #424D61;">
                            The Details overview offers the average speaking and reading time for your text. Reading Level indicates the education level needed to comprehend your writing.
                        </p>
                        <p style="color: #424D61;">
                            Disclaimer: Please note that while we aim for accuracy, we cannot guarantee it at all times.
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mt-5">
                <div class="facebook">
                    <span>
                        <asp:Label ID="faceBook" runat="server" Text="0"></asp:Label></span>
                    <span>
                        <asp:Label ID="twitter" runat="server" Text="0"></asp:Label></span>
                </div>

                <div id="lblCharacterDensity"></div>
            </div>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
