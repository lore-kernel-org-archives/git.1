Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795868083;
	b=HgtOdO+lFGrpKVHvFgyladG7svcBP965O73G/F65nT+f3cF67kAssuiMVYdU/Hvch0p2
	 Z2u/WghKUFTexU0D+L06sYvI/zbtZy3I4Cg0MhmJqsaqT7KauXyuB52ARehdJbgvxPf9C
	 hopaWiHaSAiZJaMqTaYP/DHKjh5rhubFD2sMk/zJaAJ6yHZy5sX+VE71RIMzO57r8JpFh
	 RSgx6SoAzxUMYLCbqZc1++dV2is/imdm7THiSmJ/yo3OcmTI3Hks0Wt+lEiILqsRbCpiA
	 uI9mGEYY6pe5phNy2U9JsUXqb9RtRWRR8DaN3cXPQV17men46GOUTn/hEzBQogHs1+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795868083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Sender:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tlpKCCkg1hSuZOotwcBu4HcfrMNB6Bnr1vibuJh3ijQ=;
	b=b3j0Vv7bgA2vIdMHYU2X5f91/DlGyhDC4YNl9T1dqDvO7Aih5eKMKSdOtszJIaogeSa7
	 +DxGZH+ghqLGzuDGRTYZucAYwnbhNnvbW5FO1ui/vvtnFoGkD24HshQi/C0NryYatzcf1
	 uMl9obW6y0f36DS2p6vLq0jJHJPrknfEW6YS8rU2y+z88IhRFVrkb6VdK5s41CRb+L6SF
	 g0LcwPUyXnrUJu92NmdI66wCWDGjlc2odLEd6ljJIgD6F7iZ3hcIhW05Iox9TZBy5y+g5
	 lARgZzaJnrl5+uLtzihO3MBE/w9E7+5Dq4t941R8qGpO2rTBgHLV3RHGnlXYL3XIWVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=cervined.in;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u4wmX8+S;
	arc=none smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE6E606A31F
	for <git@vger.kernel.org>; Sat, 28 Nov 2026 12:14:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEE6E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cervined.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u4wmX8+S
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3ae5ab4fcdcso64405161fa.3
        for <git@vger.kernel.org>; Sat, 28 Nov 2026 04:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795868081; x=1796472881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tlpKCCkg1hSuZOotwcBu4HcfrMNB6Bnr1vibuJh3ijQ=;
        b=u4wmX8+SK/OvNyWaWOKOjrESX18loU3qBKqu6G/AoWIPT8Oq7ptwfHzz83nuq1j8XJ
         GTuCJTXnwluaDnEeNLK8yoBsFGENpuvLzec5JpHma44I0TJyIaSjVJwBjGmCbQOi3DRX
         DUQfRNBUuDSdnuVS7eCGK5gVB7m/xJgWevzLq+kEFea4yBLgs7h/9JHDJUUFHiyqigfC
         2RBErw7yYpVnBFh8J+XKhIiwpDVTpb1eVQoCRI6d1tK6w3Sodg0LqcQ2j72GqzyLNLoX
         9B83iQwHMrXKcgLuIqcjh9wxtbHxbO/DyITXkaZ/UmJeF5dskLdKRIrLaghtfYe0fgkC
         4PMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795868081; x=1796472881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tlpKCCkg1hSuZOotwcBu4HcfrMNB6Bnr1vibuJh3ijQ=;
        b=1bB/tnYLjBzzsivGE0xnSdk4u59QnJ5s+xZ0RwnJNWyNQsLsXj+uEDozhU2LmJvn67
         xqSMcFCgoqdOG+e4k9m45eI9Nj0biLIhZr+cLjFGPAkUVBltQSQvZb2yJpL8AEGfwTV/
         WVAx0b+h8ZkdsRFAvbEZg3ee1P+qyb5O8Mboz/nJdJ3mlEChx/HFFLjDjNMfmYGZFL2a
         V4uorJDR59ly7m5i/TiwO2PCcrReBus8L2BOUORTgcCYK3QP4zzghtB+bruy4TVZCs3Q
         NnqQKQk1ycRnr7nIhCLLvCuYzV3YVxycK4nNjHM9MDbmQ4uHaFiSZ72ksCHTifvtS+O2
         N5DA==
X-Gm-Message-State: APuU4Z+9btIYQxp9/i+TkMMpuDJNqnj0Pj3O3EiZZEx9D+BsglXXo3mp
	fzDGNK1MnKBDy5oTKiv85GeCJwTSZyCUpIfcbWi4Ef4iEfp3/LSPA/YqeYGI8Q==
X-Gm-Gg: AZFdTZfjtsPyj5eQlEucGL4ix47dVsCfoJvgh9JGsgM0+jVHW/SVNTze9YQEXHTQTJy
	DhXeSOgFZqhr0ZWwI8RA1auCCa2WGjpaYfRxBjHFfcEUepirK158oudp+/Jy2S9cWOHowsV3z+z
	+Sx3ubJZakDSHhTj8nOsvgzei7uqMt4c3ne8lrMnFikCS+TgIBROYHDhhBAw4xcqH/hp0YlQSQa
	K/HwXA5nFROGjoMsmyyLOGil/C/oczzveuG3uQgns5P3FQ2ccqDyB+XyT/9WyuHY6tUPTJKRvqC
	ev/e98lBajgFoEVJ14iaiH1rYLo1YzbKCcPEyO3dD59vggW580RGEa4DtW6+eGcOIx5I6uY5QAr
	gHjsyXxFhRRoMn3znx6tXX3A3fkR6lLkusRnBxFyl1U8WN/JEbDE6iggR7qs9reeoKgFl+0xHOv
	4Io0KNK8idj9z6bLhM/Riz1dxRLtUPaHUK2gbPyIiE57srKG9jl2Zq6x5nrPqCP+wbsWOqUCk+8
	xmBruMr0uY4AlO9h/4fQ0FAyWQzxPEnhO/mV8QlRpxr5A7T28s7VWHUtS0tmdd//U60gZuBFsvr
	MzmSmIELZdI64dNlbIJzpkYd7AHz2Jii4Oof3PkX/+YJsyPSSy/aT8lO4iXOWhGPchxZnosMm/d
	AvRY/ObxS+UoJwQFtowRmvciQZUWhubgCTNk0WvB1DO6NQQ==
X-Received: by 2002:a05:651c:419b:b0:3ac:433c:6ab7 with SMTP id 38308e7fff4ca-3ae7f9f2550mr65230751fa.16.1795868080745;
        Sat, 28 Nov 2026 04:14:40 -0800 (PST)
Received: from localhost ([2001:2043:be0a:d700:bd32:e7e3:cfbd:5b51])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8044e00dsm74599701fa.3.2026.11.28.04.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 04:14:40 -0800 (PST)
Sender: Erik <erik88@gmail.com>
From: Erik Cervin-Edin <erik@cervined.in>
To: git@vger.kernel.org
Cc: gitster@pobox.com,
	phillip.wood123@gmail.com,
	Erik Cervin-Edin <erik@cervined.in>
Subject: [PATCH v5 2/3] commit: allow -m/-F for all --fixup variants
Date: Sat, 28 Nov 2026 13:14:00 +0100
Message-ID: <051b659965fb31ee7c074d0cd31719fdf2027701.1795867565.git.erik@cervined.in>
X-Mailer: git-send-email 2.56.1.978.gcc9bcf3eaa
In-Reply-To: <cover.1795867565.git.erik@cervined.in>
References: <cover.1795562078.git.erik@cervined.in> <cover.1795867565.git.erik@cervined.in>
X-Mailing-List: git@vger.kernel.org
List-Id: <git.vger.kernel.org>
List-Post: <mailto:git@vger.kernel.org>
List-Help: <mailto:git+help@vger.kernel.org>
List-Subscribe: <mailto:git+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:git+unsubscribe@vger.kernel.org>
List-Owner: <mailto:git+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ability to provide a commit message for git commit --fixup and its
variants is limited:

  * Plain --fixup accepts -m but not -F

  * The amend/reword variants accept a message only through an editor
    (or a GIT_EDITOR script standing in for one)

This makes the amend/reword variants poorly suited for non-interactive
workflows -- notably when using AI coding agents.

When --fixup learned to take -m [1], it was noted that other options
(-c/-C/-F) could also be supported, but were left out for lack of a
clear use case.  Later, when the amend suboption was introduced in [2],
-m was initially supported for amend fixups too, but was dropped for the
same reason [3].

The rejections of these options hark back to when --fixup was introduced
in [4], but as [1] noted, nothing inherently prevents supporting them.

The current patchwork of which options work with which --fixup variants
has no strong logic to it, and allowing all of them simplifies the
interface.

Allow -m and -F to supply the message body for all --fixup variants,
mirroring the flow of a regular commit.  With --fixup=amend/reword the
given message replaces the one that would otherwise be copied from the
target commit.  Options -c and -C are handled in the next commit.

1. 30884c9afc (commit: add support for --fixup <commit> -m"<extra
   message>", 2017-12-22)

2. 494d314a05 (commit: add amend suboption to --fixup to create amend!
   commit, 2021-03-15)

3. https://lore.kernel.org/git/xmqqft1o80pe.fsf@gitster.g/

4. d71b8ba7c9 (commit: --fixup option for use with rebase --autosquash,
   2010-11-02)

Helped-by: Junio C Hamano <gitster@pobox.com>
Helped-by: Phillip Wood <phillip.wood123@gmail.com>
Signed-off-by: Erik Cervin-Edin <erik@cervined.in>
---
 Documentation/git-commit.adoc             | 19 ++++----
 builtin/commit.c                          |  5 +-
 t/t7500-commit-template-squash-signoff.sh | 56 +++++++++++++++++------
 3 files changed, 53 insertions(+), 27 deletions(-)

diff --git a/Documentation/git-commit.adoc b/Documentation/git-commit.adoc
index 8329c1034b..61efd29e66 100644
--- a/Documentation/git-commit.adoc
+++ b/Documentation/git-commit.adoc
@@ -103,20 +103,21 @@ include::diff-context-options.adoc[]
 The commit created by plain `--fixup=<commit>` has a title
 composed of "fixup!" followed by the title of _<commit>_,
 and is recognized specially by `git rebase --autosquash`. The `-m`
-option may be used to supplement the log message of the created
-commit, but the additional commentary will be thrown away once the
-"fixup!" commit is squashed into _<commit>_ by
+or `-F` option may be used to supplement the log message
+of the created commit, but the additional commentary will be thrown
+away once the "fixup!" commit is squashed into _<commit>_ by
 `git rebase --autosquash`.
 +
 The commit created by `--fixup=amend:<commit>` is similar but its
 title is instead prefixed with "amend!". The log message of
 _<commit>_ is copied into the log message of the "amend!" commit and
-opened in an editor so it can be refined. When `git rebase
---autosquash` squashes the "amend!" commit into _<commit>_, the
-log message of _<commit>_ is replaced by the refined log message
-from the "amend!" commit. It is an error for the "amend!" commit's
-log message to be empty unless `--allow-empty-message` is
-specified.
+opened in an editor so it can be refined. The replacement message may
+also be supplied directly using `-m` or `-F`, bypassing the
+need to open an editor. When `git rebase
+--autosquash` squashes the "amend!" commit into _<commit>_, the log
+message of _<commit>_ is replaced by the refined log message from the
+"amend!" commit. It is an error for the "amend!" commit's log message
+to be empty unless `--allow-empty-message` is specified.
 +
 `--fixup=reword:<commit>` is shorthand for `--fixup=amend:<commit>
  --only`. It creates an "amend!" commit with only a log message
diff --git a/builtin/commit.c b/builtin/commit.c
index 698823d4fa..e0fac284bc 100644
--- a/builtin/commit.c
+++ b/builtin/commit.c
@@ -793,8 +793,6 @@ static int prepare_to_commit(const char *index_file, const char *prefix,
 		repo_format_commit_message(the_repository, c, fmt, &sb,
 					   &ctx);
 		free(fmt);
-		if (have_option_m && !strcmp(fixup_prefix, "amend"))
-			die(_("options '%s' and '%s:%s' cannot be used together"), "-m", "--fixup", fixup_message);
 	} else if (squash_message) {
 		/*
 		 * Insert the proper subject line before other commit
@@ -1331,9 +1329,8 @@ static int parse_and_validate_options(int argc, const char *argv[],
 	}
 	if (fixup_message && squash_message)
 		die(_("options '%s' and '%s' cannot be used together"), "--squash", "--fixup");
-	die_for_incompatible_opt4(!!use_message, "-C",
+	die_for_incompatible_opt3(!!use_message, "-C",
 				  !!edit_message, "-c",
-				  !!logfile, "-F",
 				  !!fixup_message, "--fixup");
 	die_for_incompatible_opt4(have_option_m, "-m",
 				  !!edit_message, "-c",
diff --git a/t/t7500-commit-template-squash-signoff.sh b/t/t7500-commit-template-squash-signoff.sh
index 5e782ad8d7..9b2ecb1356 100755
--- a/t/t7500-commit-template-squash-signoff.sh
+++ b/t/t7500-commit-template-squash-signoff.sh
@@ -384,18 +384,24 @@ test_expect_success '--fixup=reword: ignores staged changes' '
 	test_cmp foo actual
 '
 
-test_expect_success '--fixup=reword: error out with -m option' '
+test_expect_success 'commit --fixup=reword: works with -m' '
 	commit_for_rebase_autosquash_setup &&
-	echo "fatal: options '\''-m'\'' and '\''--fixup:reword'\'' cannot be used together" >expect &&
-	test_must_fail git commit --fixup=reword:HEAD~ -m "reword commit message" 2>actual &&
-	test_cmp expect actual
+	git commit --fixup=reword:HEAD~ -m "reword commit message" &&
+	test_commit_message HEAD <<-EOF
+	amend! $(git log -1 --format=%s HEAD~2)
+
+	reword commit message
+	EOF
 '
 
-test_expect_success '--fixup=amend: error out with -m option' '
+test_expect_success 'commit --fixup=amend: works with -m' '
 	commit_for_rebase_autosquash_setup &&
-	echo "fatal: options '\''-m'\'' and '\''--fixup:amend'\'' cannot be used together" >expect &&
-	test_must_fail git commit --fixup=amend:HEAD~ -m "amend commit message" 2>actual &&
-	test_cmp expect actual
+	git commit --fixup=amend:HEAD~ -m "amend commit message" &&
+	test_commit_message HEAD <<-EOF
+	amend! $(git log -1 --format=%s HEAD~2)
+
+	amend commit message
+	EOF
 '
 
 test_expect_success 'consecutive amend! commits remove amend! line from commit msg body' '
@@ -432,6 +438,13 @@ test_expect_success 'deny to create amend! commit if its commit msg body is empt
 	test_cmp expected actual
 '
 
+test_expect_success 'deny to create amend! commit if -m is empty' '
+	commit_for_rebase_autosquash_setup &&
+	echo "Aborting commit due to empty commit message body." >expect &&
+	test_must_fail git commit --fixup=amend:HEAD~ -m "" 2>actual &&
+	test_cmp expect actual
+'
+
 test_expect_success 'amend! commit allows empty commit msg body with --allow-empty-message' '
 	commit_for_rebase_autosquash_setup &&
 	cat >expected <<-EOF &&
@@ -468,10 +481,26 @@ test_expect_success '--fixup=reword: give error with pathsec' '
 	test_cmp expect actual
 '
 
-test_expect_success '--fixup=reword: -F give error message' '
-	echo "fatal: options '\''-F'\'' and '\''--fixup'\'' cannot be used together" >expect &&
-	test_must_fail git commit --fixup=reword:HEAD~ -F msg  2>actual &&
-	test_cmp expect actual
+test_expect_success 'commit --fixup works with -F' '
+	commit_for_rebase_autosquash_setup &&
+	echo "message" >msgfile &&
+	git commit --fixup HEAD~ -F msgfile &&
+	test_commit_message HEAD <<-EOF
+	fixup! $(git log -1 --format=%s HEAD~2)
+
+	message
+	EOF
+'
+
+test_expect_success 'commit --fixup=reword: works with -F' '
+	commit_for_rebase_autosquash_setup &&
+	echo "message from file" >msgfile &&
+	git commit --fixup=reword:HEAD~ -F msgfile &&
+	test_commit_message HEAD <<-EOF
+	amend! $(git log -1 --format=%s HEAD~2)
+
+	$(cat msgfile)
+	EOF
 '
 
 test_expect_success 'commit --squash works with -F' '
@@ -526,8 +555,7 @@ test_expect_success 'invalid message options when using --fixup' '
 	git add foo &&
 	test_must_fail git commit --fixup HEAD~1 --squash HEAD~2 &&
 	test_must_fail git commit --fixup HEAD~1 -C HEAD~2 &&
-	test_must_fail git commit --fixup HEAD~1 -c HEAD~2 &&
-	test_must_fail git commit --fixup HEAD~1 -F log
+	test_must_fail git commit --fixup HEAD~1 -c HEAD~2
 '
 
 cat >expected-template <<EOF
-- 
2.56.1.978.gcc9bcf3eaa

