(() => {
  domtoimage.toBlob(document.getElementById("my-node")).then(function (blob) {
    window.saveAs(blob, "my-image-name.png");
  });
})();
