<?php
include("functions.php");

$id = $_GET['id'];
session_start();

if($id==null){
    session_start();
    if($_SESSION['newnote']==1){
        $pdo = connect_to_db();
        $user_id = $_SESSION['newnoteid']; 
        $sql = 'SELECT * FROM studyselfnote WHERE id=:id';
        $stmt = $pdo->prepare($sql);
        $stmt->bindValue(':id', $user_id, PDO::PARAM_INT);
        try {
            $status = $stmt->execute();
        } catch (PDOException $e) {
            echo json_encode(["sql error" => "{$e->getMessage()}"]);
            exit();
        }
        $record = $stmt->fetch(PDO::FETCH_ASSOC);  
    }
    else{
    session_start();
    $value = $_SESSION['newnote'];
    $pdo = connect_to_db();
    $sql = 'SELECT * FROM studyselfnote WHERE id=:id';
    $stmt = $pdo->prepare($sql);
    $stmt->bindValue(':id', $value, PDO::PARAM_INT);
    try {
        $status = $stmt->execute();
    } catch (PDOException $e) {
        echo json_encode(["sql error" => "{$e->getMessage()}"]);
        exit();
    }

    $record = $stmt->fetch(PDO::FETCH_ASSOC);}
}
else{
    $pdo = connect_to_db();
    $sql = 'SELECT * FROM studyselfnote WHERE id=:id';
    $stmt = $pdo->prepare($sql);
    $stmt->bindValue(':id', $id, PDO::PARAM_INT);
    try {
        $status = $stmt->execute();
    } catch (PDOException $e) {
        echo json_encode(["sql error" => "{$e->getMessage()}"]);
        exit();
    }

    $record = $stmt->fetch(PDO::FETCH_ASSOC);
}




?>
<!DOCTYPE html>
<html lang="ja">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/note.css" />
    <title>studyself</title>

</head>

<body>
    <header>
        <dialog>
            <form method="post" action="notename_update.php" class=dialog>
                <p class=dialog_title>名前変更</p>
                <p class=dialog_notename> ノートの名前:</p>
                <input type=text name="notename" value="<?= $record['notename'] ?>">
                <div>
                    <input type="hidden" name="id" value="<?= $record['id'] ?>">
                </div>
                <button type="submit" class=dialog_note_create>名前変更</button>
            </form>
            <button id="dialogClose">☓</button>
        </dialog>
        <button id="noteCreate" class="noteCreate"><?= $record['notename'] ?></button>
    </header>
    <div class=note>

        <div class="paper">
            <button id="noteAdd" class="noteadd">+</button>
            <div class="lines">
                <div class="text">
                    <!--<div class="text" contenteditable spellcheck="false">だった-->
                    <div class=editArea>
                        <div id="editor"></div>
                    </div>
                </div>
                <div class="holes hole-top"></div>
                <div class="holes hole-middle"></div>
                <div class="holes hole-bottom"></div>
            </div>
            <div id=editCan class=editCan></div>
            <button id="save" class="btn">保存</button>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/@editorjs/editorjs@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/header@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/list@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/checklist@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/quote@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/code@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/marker@latest"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script>
        const showDialog = document.querySelector('dialog');
        const noteCreate = document.getElementById('noteCreate');
        const dialogClose = document.getElementById('dialogClose');
        noteCreate.addEventListener('click', () => {
            console.log("aaa");
            showDialog.showModal();
        }, false);
        dialogClose.addEventListener('click', function() {
            showDialog.close();
        }, false);

        // document.body.addEventListener('keydown',
        //         event => {
        //             if (event.key === 'Enter') {
        //                 let cnt = $(".ce-block").length;
        //                 console.log(cnt);
        //                 if (cnt%15==0) {
        //                     console.log("111");
        //                 }
        //             }

        //         });


        class MarkerTool {

            static get isInline() {
                return true;
            }

            get state() {
                return this._state;
            }

            set state(state) {
                this._state = state;

                this.button.classList.toggle(this.api.styles.inlineToolButtonActive, state);
            }

            constructor({
                api
            }) {
                this.api = api;
                this.button = null;
                this._state = false;

                this.tag = 'MARK';
                this.class = 'cdx-marker';
            }

            render() {
                this.button = document.createElement('button');
                this.button.type = 'button';
                this.button.innerHTML = '<svg width="20" height="18"><path d="M10.458 12.04l2.919 1.686-.781 1.417-.984-.03-.974 1.687H8.674l1.49-2.583-.508-.775.802-1.401zm.546-.952l3.624-6.327a1.597 1.597 0 0 1 2.182-.59 1.632 1.632 0 0 1 .615 2.201l-3.519 6.391-2.902-1.675zm-7.73 3.467h3.465a1.123 1.123 0 1 1 0 2.247H3.273a1.123 1.123 0 1 1 0-2.247z"/></svg>';
                this.button.classList.add(this.api.styles.inlineToolButton);

                return this.button;
            }

            surround(range) {
                if (this.state) {
                    this.unwrap(range);
                    return;
                }

                this.wrap(range);
            }

            wrap(range) {
                const selectedText = range.extractContents();
                const mark = document.createElement(this.tag);

                mark.classList.add(this.class);
                mark.appendChild(selectedText);
                range.insertNode(mark);

                this.api.selection.expandToTag(mark);
            }

            unwrap(range) {
                const mark = this.api.selection.findParentTag(this.tag, this.class);
                const text = range.extractContents();

                mark.remove();

                range.insertNode(text);
            }


            checkState() {
                const mark = this.api.selection.findParentTag(this.tag);

                this.state = !!mark;

                if (this.state) {
                    this.showActions(mark);
                } else {
                    this.hideActions();
                }
            }

            renderActions() {
                this.colorPicker = document.createElement('input');
                this.colorPicker.type = 'color';
                this.colorPicker.value = '#f5f1cc';
                this.colorPicker.hidden = true;

                return this.colorPicker;
            }

            showActions(mark) {
                const {
                    backgroundColor
                } = mark.style;
                this.colorPicker.value = backgroundColor ? this.convertToHex(backgroundColor) : '#f5f1cc';

                this.colorPicker.onchange = () => {
                    mark.style.backgroundColor = this.colorPicker.value;
                };
                this.colorPicker.hidden = false;
            }

            hideActions() {
                this.colorPicker.onchange = null;
                this.colorPicker.hidden = true;
            }

            convertToHex(color) {
                const rgb = color.match(/(\d+)/g);

                let hexr = parseInt(rgb[0]).toString(16);
                let hexg = parseInt(rgb[1]).toString(16);
                let hexb = parseInt(rgb[2]).toString(16);

                hexr = hexr.length === 1 ? '0' + hexr : hexr;
                hexg = hexg.length === 1 ? '0' + hexg : hexg;
                hexb = hexb.length === 1 ? '0' + hexb : hexb;

                return '#' + hexr + hexg + hexb;
            }
            static get sanitize() {
                return {
                    mark: {
                        class: 'cdx-marker'
                    }
                };
            }
        }

        const editor = new EditorJS({

            holder: 'editor',
            minHeight: 10,
            tools: {

                Marker: { //マーカーツールを読み込む。
                    class: MarkerTool,
                    shortcut: 'CMD+SHIFT+M',
                },
                header: Header,
                list: List,
                checklist: Checklist,
                quote: Quote,
                code: CodeTool

            }


        });
        //ノート追加
        const addNote = document.getElementById('noteAdd');
        addNote.addEventListener('click', () => {
            console.log("aaa");
        });


        //保存
        const save = document.getElementById('save');
        save.addEventListener('click', () => {
            editor.save()
                .then((savedData) => {
                    console.log(savedData.blocks);
                    let ajaxindex = savedData.blocks;
                    console.log(ajaxindex);
                    $.ajax({
                        url: "date_recieve.php", // 送信先のPHP
                        type: "POST", // POSTで送る
                        dataType: "text",
                        //必須ではなさそうだが、サーバ側との整合のために明示しておいた方がよいと書かれていたが、以下を指定すると、ajaxエラーになる。dataType: 'json', 

                        data: {
                            "name":ajaxindex
                        },

                    }).done(function(data) {
                        console.log('success!!');
                        console.log(data);
                    }).fail(function(XMLHttpRequest, textStatus, errorThrown) {
                        console.log('error!!!');
                        console.log("XMLHttpRequest : " + XMLHttpRequest.status);
                        console.log("textStatus     : " + textStatus);
                        console.log("errorThrown    : " + errorThrown.message);

                    })

                    //location.href="date_recieve.php"
                })


        });
    </script>
</body>

</html>