// const copy_text = document.querySelector('#copy-textarea');
// const copy_btn = document.querySelector('#copy-btn');

// copy_btn.addEventListener(`click`, () => {
//   // copy eventにテキストをコピー、成功の可否で結果を表示する
//   navigator.clipboard.writeText(copy_text).then(() => {
//     output.textContent = 'Copied it to the clipboard.';
//   }, () => {
//     output.textContent = 'Could not copy.';
//   });

// });

// document.write("dsaffdas");

// テキストエリアの文字を取得
// const txt = document.getElementById("copy-textarea").value;

// document.write("<p>JavaScriptのテスト</p>");
// // document.write(txt);

// const copy = () => {
//   // テキストエリアの文字を取得
//   const txt = document.getElementById("my-text-area").value;
//   console.log(txt);

//   // クリップボードにコピー
//   navigator.clipboard.writeText(txt);
// };

async function copyToClipboard(obj) {
  const element = obj.previousElementSibling;
  // クリップボードAPIが使え、且つ、値が空でない時
  if (navigator.clipboard && !element.value == false) {
    await navigator.clipboard.writeText(element.value);
    alert("コピーされました！");
  } else {
    alert("コピーされませんでした！");
  }
}