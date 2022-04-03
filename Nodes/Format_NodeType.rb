#本ファイルはNode-REDで自作したノードをRubyコード生成に適用させるための一般刑のプログラムファイル
#LEDノードやI2Cノードといったノード情報をマイコン用Rubyコードに変換させるには、同フォルダ下にある「LED.rb」や「I2C.rb」のようなノードプログラムを作成する必要がある。
#本ファイルはそれらノードプログラムを一般化させたものである。
#コード中にある「NodeType」は、Node-REDのノード自作で設定したノードタイプの名前と同じにする。(:type=>"LED"であればNode_LED()になる)
/「NodeType」ノードのノードプログラム/
def Node_NodeType(node_id)
    /自宛のデータの有無の確認と有った場合の対象データの削除/
    input_array = Dataprocessing(node_id,:get)
    Dataprocessing(node_id,:delete)
    if input_array == []
        return 0
    end

    /受け取ったデータに「0」があればノードプログラム終了(場合によっては削除しても問題なし)/
    input_array.each do |input_data|
        if input_data == 0
            return 0
        end
    end

    /本機能/
    #受け取ったデータは「input_array」に格納されている。これを利用して様々な処理をこの箇所でコーディングしていく
    #次のノードにデータを送信したい場合、「output」に結果値を代入すればよい
    #
    #
    #

    /次のノードにデータを送る/
    Dataprocessing(node_id,:create,[output])
end