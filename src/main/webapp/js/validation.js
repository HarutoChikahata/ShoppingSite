function validatePassword() {
    const password = document.getElementById("password").value;
    const confirm = document.getElementById("passwordConfirm").value;
    const email = document.getElementById("mailAddress").value;
	const memberIdInput = document.getElementById("memberId");
	    const memberId = memberIdInput ? memberIdInput.value : "";
    //半角英数字かつ6文字以上かどうかをチェックする正規表現のパターン
    // (半角の英字、数字、一般的な記号が含まれる「半角文字」が6文字以上連続しているか)
    const passwordPattern = /^[a-zA-Z0-9!-/:-@[-`{-~]{6,}$/;
    const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/; 
	const idPattern = /^[a-zA-Z0-9]+$/;

    //長さと半角文字のバリデーションチェック
    if (!passwordPattern.test(password)) {
        alert("❌ パスワードは「6文字以上の半角文字（英数字・記号）」で入力してください。全角文字は使用できません。");
        return false; //画面を止める
    }

    if (!emailPattern.test(email)) {
        alert("❌ メールアドレスの形式が正しくありません。すべて半角の英数字・記号で正しく入力してください。");
        return false; //送信を止める
    }
	
	// 💡 2. 会員IDの半角英数字バリデーションチェック（一番最初にかける！）
	// ※新規登録画面（memberIdが存在する画面）のときだけチェックが走るようにします
    if (memberIdInput && !idPattern.test(memberId)) {
	    alert("❌ 会員IDは「半角英数字のみ」で入力してください。全角文字やスペース、記号は使用できません。");
	    return false; //送信を止める
	    }

    //2つのパスワードが一致しているかのチェック
    if (password !== confirm) {
        alert("❌ パスワードと確認用パスワードが一致しません。もう一度ご確認ください。");
        return false; //画面を止める
    }
    
    return true; //すべてクリアならサーブレットへ
}
