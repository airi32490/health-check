function memo () {
  const submit = document.getElementById("submit");
  submit.addEventListener("click", (e) => {
    const formData = new FormData(document.getElementById("form"));
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/comments", true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      const item = XHR.response.post;
      const list = document.getElementById("list");
      const formText = document.getElementById("memo");
      const HTML =  `
      <div class="border border-dark mt-3 px-2 py-2 post" data-id=${item.id}>
        <div class="post-content">
          ${item.memo}
        </div>
        <div class="post-date">
          <span class="text-primary">新規コメント</span>：${item.created_at}
        </div>
      </div>`;
      list.insertAdjacentHTML("afterend", HTML);
      formText.value = "";
    };
    e.preventDefault();
  });
}
window.addEventListener("load", memo);