// HTML要素を取得
const boldButton = document.getElementById("boldButton");
const italicButton = document.getElementById("italicButton");
const underlineButton = document.getElementById("underlineButton");
const editor = document.getElementById("editor");

// ボタンクリック時のイベントリスナーを追加
boldButton.addEventListener("click", () => {
  document.execCommand("bold", false, null);
});

italicButton.addEventListener("click", () => {
  document.execCommand("italic", false, null);
});

underlineButton.addEventListener("click", () => {
  document.execCommand("underline", false, null);
});
// フォント選択と文字サイズ変更の要素を取得
const fontSelect = document.getElementById('fontSelect');
const fontSizeSelect = document.getElementById('fontSizeSelect');

// フォント選択の変更イベントリスナーを追加
fontSelect.addEventListener('change', () => {
    const selectedFont = fontSelect.value;
    editor.style.fontFamily = selectedFont;
});

// 文字サイズ変更の変更イベントリスナーを追加
fontSizeSelect.addEventListener('change', () => {
    const selectedSize = fontSizeSelect.value;
    editor.style.fontSize = selectedSize;
});

const fontSizeInput = document.getElementById("fontSizeInput");
const applyFontSizeButton = document.getElementById("applyFontSize");

applyFontSizeButton.addEventListener("click", () => {
  const enteredSize = fontSizeInput.value;
  editor.style.fontSize = enteredSize + "px";
});