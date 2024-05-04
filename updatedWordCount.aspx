<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="updatedWordCount.aspx.cs" Inherits="WordCountTool.updatedWordCount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Css/StyleSheet.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
    <script src="https://kit.fontawesome.com/a21ed19279.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Prompt:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet" />
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


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
            document.getElementById('<%= lblWordCount.ClientID %>').innerText = wordCount;
            document.getElementById('<%= lblChar.ClientID %>').innerText = charCount;
            document.getElementById('<%= sentences.ClientID %>').innerText = sentenceCount;
            document.getElementById('<%= paragraphs.ClientID %>').innerText = paragraphCount;

            //Facebook
            var initialCount = 250;
            var initialGoogleCount = 300;
            var initialTweetCount = 280;
            var currentLength = inputText.length;
            var remainingCount = initialCount - currentLength;
            var remainingGoogleCount = initialGoogleCount - currentLength;
            var remainingTweetCount = initialTweetCount - currentLength;
            document.getElementById('lbl_Facebook').innerText = remainingCount;
            document.getElementById('lbl_twitter').innerText = remainingTweetCount;
            document.getElementById('lbl_google').innerText = remainingGoogleCount;






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



     <%--   var text = document.getElementById('<%= txtInput.ClientID %>');
        localStorage.setItem('name', text);--%>

       
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <section>
            <div class="container wordCount-hero">
                <div class="wordCount-main">
                    <div class="row">
                        <div class="col-lg-8 col-md-12 ">
                            <div class="wordCount-leftSection">
                                <h1 style="text-align: center; color: #ff6a06">Word Count</h1>
                                <h6 style="text-align: center; color: #6C757D;">(A simple and free word counter and character counter)</h6>
                                <div class="wordCount-tool mt-3 p-2">
                                    <div class="header-Section">
                                        <div class="word-section">
                                            <p>WORDS</p>
                                            <h2 class="countH2">
                                                <asp:Label ID="lblWordCount" runat="server" Text="0"></asp:Label></h2>
                                        </div>
                                        <div class="character-section">
                                            <p>CHARACTERS</p>
                                            <h2 class="countH2">
                                                <asp:Label ID="lblChar" runat="server" Text="0"></asp:Label></h2>
                                        </div>
                                        <div class="facebook-section">
                                            <p>FACEBOOK</p>
                                            <p class="countH2">
                                                <span style="font-size: 23px; font-weight: 600;">
                                                    <i class="fa-brands fa-facebook fbIcon"></i>
                                                    <asp:Label ID="lbl_Facebook" runat="server" Text="250"></asp:Label>/</span><span>250</span>
                                            </p>
                                        </div>
                                        <div class="twitter-section">
                                            <p>TWITTER</p>
                                            <p class="countH2">
                                                <span style="font-size: 23px; font-weight: 600;">
                                                    <i class="fa-brands fa-x-twitter"></i>
                                                    <asp:Label ID="lbl_twitter" runat="server" Text="280"></asp:Label>/</span><span>280</span>
                                            </p>

                                        </div>
                                        <div class="google-section">
                                            <p>GOOGLE</p>
                                            <p class="countH2">
                                                <span style="font-size: 23px; font-weight: 600;">
                                                    <i class="fa-brands fa-google"></i>
                                                    <asp:Label ID="lbl_google" runat="server" Text="300"></asp:Label>/</span><span>300</span>
                                            </p>
                                        </div>
                                    </div>
                                    <asp:TextBox ID="txtInput" runat="server" TextMode="MultiLine" Rows="15" CssClass="form-control" oninput="updateCounts()"></asp:TextBox>
                                    <div class="bottom-checker">
                                        <div>
                                            <span>PARAGRAPH</span> -
                                            <asp:Label ID="paragraphs" runat="server" Text="0"></asp:Label>
                                        </div>
                                        <div>
                                            <span>SENTENCE</span> -
                                            <asp:Label ID="sentences" runat="server" Text="0"></asp:Label>
                                        </div>

                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4  col-md-12  mt-5">
                            <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Veritatis, similique possimus quasi modi, sapiente obcaecati eveniet illum fugit exercitationem, maxime alias? Quos, corrupti eveniet? Aliquam, aut. Odio molestiae mollitia perferendis sapiente voluptate accusantium eos repellendus illo eveniet assumenda optio eligendi tenetur explicabo facere, quas officiis fugiat nemo vitae molestias unde natus ab eum. Reprehenderit animi quae quasi voluptatum earum rem.</p>

                             <div id="lblCharacterDensity"></div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </form>

        <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"
    ></script>
</body>
</html>
