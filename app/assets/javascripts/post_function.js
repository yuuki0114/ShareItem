$(function() {
  const buildFileField = function() {
    const html = '<input id= "imageFile" type= "file" name= "item[image]">';
    return html;
  }

  // プレビュー用のimgタグを生成する関数
  const buildImg = function(url) {
  const html = `<div class="preview__image">
                  <img src="${url}">
                  <div class="preview__image--remove">削除する</div>
                </div>`;
  return html;
  }

  $('#imageBox').on('change', '#imageFile', function(e) {
    // 画像ファイルに合わせてプレビューを変化
    let value = $(".preview").children().length
    if(value > 0){
      $(".preview").children().remove();
    };

    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    // 画像をプレビュー表示させる処理
    $('.preview').append(buildImg(blobUrl));
  })

  // 削除機能
  $('.preview').on('click', '.preview__image--remove', function() {
    // プレビュー情報を取得し削除
    var  previewImage= $(this).parent();
    previewImage.remove();

    //input要素を削除
    $('#imageFile').remove();
    $('').prop("checked", true);

    // 新しい画像投稿のタグを追加
    if ($('#imageFile').length == 0) {
      const test =$('#imageBox').append(buildFileField);
    }
    });
});