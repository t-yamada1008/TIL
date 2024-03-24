// 説明: ファイル操作プログラムのJavaScriptファイル
// ファイルの内容を表示する

// document: HTMLファイルの要素を取得する
// getElementById: ID属性を指定して要素を取得する
// addEventListener: イベントリスナーを追加する
    // イベントリスナー: イベントが発生したときに実行される関数
// change: ファイルが選択されたときのイベント
// function(event): イベントが発生したときに実行される関数
    // const: 変数を宣言する
    // FileReader: ファイルの内容を読み込む
    // new: インスタンスを生成する
    // FileReader(): ファイルの内容を読み込む
        // FileReaderはどこで定義されているのか？
        // https://developer.mozilla.org/ja/docs/Web/API/FileReader
    // onload: ファイルの読み込みが完了したときのイ
    // readerは何かというと、FileReaderのインスタンス
    // function(event): イベントが発生したときに実行される関数
        // document: HTMLファイルの要素を取得する
        // getElementById: ID属性を指定して要素を取得する
        // textContent: テキストコンテンツを取得する
        // event: イベント
        // target: イベントの対象
        // result: ファイルの内容
            //このeventは何かというと、FileReaderのonloadイベントが発生したときに、そのイベントオブジェクトが渡される
    // readAsText: ファイルの内容をテキストとして読み込む
        // event.target.files[0]: 選択されたファイルの1つ目
            // なぜfiles[0]なのか？
            // https://developer.mozilla.org/ja/docs/Web/API/FileList
            // 複数のファイルを選択できるため、配列でファイルを取得する
            // 今回は1つ目のファイルを取得する
                //　なぜ1つ目のファイルを取得するのか？
                // https://developer.mozilla.org/ja/docs/Web/API/FileList
                // ファイルのリストを取得する
                // ファイルのリストは、ファイルのリストを表すFileListオブジェクト
                // 選択ボタンならば、1つのファイルを選択する

document.getElementById("file").addEventListener("change", function(event) {
    const reader = new FileReader();
    reader.onload = function(event) {
        document.getElementById("file-content").textContent = event.target.result;
    };
    reader.readAsText(event.target.files[0]);
});