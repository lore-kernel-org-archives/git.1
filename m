Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795868092;
	b=pOxRxeFPsAf78vl+t03u/gz4pvT92dnJyWOiEUKjlQ/PF8pZEzClIfKKfbrGReH8OgPR
	 xO6JU2FCvaOmEhW4A1wDM+fM0s2D2dGz1WB6Qyk5wPKKwIaI42NIK7WY5vumdea+XUBmw
	 Z12vXRxgcRJEtp6sWolFcNx82SQ4V+XHxUFdkiUz/jKb9iY/hUielFBWidSEQ9E/5RYax
	 g3dv1wL1JNKq/Ts0QP3CvyNe8/eLJBl9fQ01GhKGoj17h7aG8yNgFy/sQYO+w6xpTXAAV
	 VkLiDsP6zqNblfxAinJ4vJzMNYU4wJT1m56x1Vn/a4CDk/kxIyxuymmkmxUAlC81duA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795868092;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Sender:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kP6qta1KfzCwaV3PTq+1vGWOwfVD5BptfbgW3OBzdsI=;
	b=1P+u3z8sZ7FDz+uEYYSaOlfe7/mDL3DQn190knT1Jx0LY+YV5q5YAFnltbCRU/gDCNmC
	 U0Nk9kYsTEco9TXnzOOWhXJpo1ENGzbCmHRh2h5yk3oABB6JelXVCDg8NFl9/dlTgCPUJ
	 zTcdn+d5l1s5OFKfE61w6YldiUFiaNAJ8BrQDfdhCApNLP2IYK3Y/pLvOAWknjWA1tjYw
	 /Vn3VWTMAPfel/SZzpd0qyNxzwYsgT7HWY+AUtJBmK6breolNFaE4rLpxNVkP5o/u6PP9
	 Dnz81M0w8/sF2qw0uqVfDwPcgO/rbrVliBkhLPgNTxMwfh//9FTtr+BJid0zXWZdEww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=cervined.in;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vyqBbbzC;
	arc=none smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B0A606A31C
	for <git@vger.kernel.org>; Sat, 28 Nov 2026 12:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78B0A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cervined.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vyqBbbzC
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3acd239776cso75829341fa.0
        for <git@vger.kernel.org>; Sat, 28 Nov 2026 04:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795868090; x=1796472890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kP6qta1KfzCwaV3PTq+1vGWOwfVD5BptfbgW3OBzdsI=;
        b=vyqBbbzCIbu4PmfhYGJ2m3M7iFIwqk3JI2Xsdjtu5zrRcyFPjEjteldoBWrggjj0Ov
         DuLDChDkDwQxEAD7I5CUPHCHqaQHfAjqo0iJTSDtCJg+59f91yj1DiW+UmBuS9Og4l1D
         KxuQyL3KuiwWJU3QkBXBL9ZHXV1hsBpAauf8MLoFszu6UhyrVSWJGxO/up/KsVOhuttZ
         PmhSqzzhz9VCQ1mP4xD8P0RduC2xWrnLFd4bT3MOeMq+DOg0/07VEH+5XYj09psZ32qs
         ET+zQFCVBYIhI9vLojDKkQEat/Jn6C9qvPLCY3XuizdPI9SlF+AYFVrOZnoUipPLJ3ic
         MD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795868090; x=1796472890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kP6qta1KfzCwaV3PTq+1vGWOwfVD5BptfbgW3OBzdsI=;
        b=26B+SfrUqt0HN/0IjKMmOVHAZbWiOGVmq7UsJYcQ2O1VtrrzrlOkZ5gPv7epKZ+Pbl
         1BCr/QhCaXuvOKw3M3fmK+IBF9LVOd/lJvtqIzx1iGFoscyAIn0U6N7uny8gaoqs4TJM
         Dp+wss1+OTkaEGlzlR609pM9Wdh523CAMbhE2ev5SvlFXCy9u7ghbfKm3KyVih8Cg8nL
         8HeIvrNGOTsY6vXMxlTN5+e/FmzrKuTMIgO8OLh8DB0ZA6YyY7zMhEg2pudHazXCXwWT
         m2WJsW3sflQh5njgh82ch9icmNJazyPUpacPsGd8zAYNMxh3MfaztI19+mem8GE6Ye4m
         asTw==
X-Gm-Message-State: APuU4Z8sl0ZdQ5WxnziQ2bfC3TioQ80K/rBqXnc2qvVu1yhBXwNo/kVW
	BrCpeULSluUHrDcHVZay4rRfd4W5SZUW2NQNdjYlForsReGidtszUjasJ2To5A==
X-Gm-Gg: AZFdTZeyxgoDM2/HwD2Ba2pXC45pPX5fz8t0foaSIEK1DABxfDQEuGSsjjhaCRV6FZS
	zZYei8BdxrgVusoc+v8t2GtrQBJKEh/Ms7Ol9x9IitVbuZXdSzGYbs+7m/aOOdDF4qMfcQRr8QG
	J0gEMmV5FmkWz72390CXZ7ubjjXxnVCkgpWOObFTV5sdiXhaa0wdBdhKg49NEEElw20WtbDLD3x
	NTtP70uGxEOLGGl8/qFSOtBiSXCB9BDAu3JCeb7nsV6eGh0mGfptq6iySMFKyOFaSXGE4tIlBzl
	Sl55jOsgNABY3Z/SLhtJdsujS1ogz3qkS7Yy4Q1qGB1P/K+99S64zLHgsxn3TxCrSTtAWqPxW3c
	FdxA5MPh/vtZITg0BplToEpWm8yst4Ekrd2nX7BjkxzNImbW9U6zTABS1QR5IdYLOY1rgWZlEir
	ohzypBEa0cYk3dpcsmsI7ThGws+2UJq779FNhb1yAKEeLCev6nZw9Wd7EDdSmLqT9iW9etdhsvw
	AL5Sb6HXsEBjkrP9QKwYhxagb2I0VxRmRI1ytumR7uroqGEiaOy/+bAtd2IoWqxgwDBeltwTnhp
	QPLED2l/cS+vkBxPD3A+/fGPXsAAH3v+6V4qx9o1HA75IvmpIelmsGPlOrChtiWNhIgxWEB9uwM
	Xc2bqtpg+Ru7Y4KJRQcJJDSLn/1KO+AwzquCKpyeDk1aitw==
X-Received: by 2002:a2e:9a0d:0:b0:3ae:5b4d:615a with SMTP id 38308e7fff4ca-3ae7f9b2390mr90701811fa.8.1795868090240;
        Sat, 28 Nov 2026 04:14:50 -0800 (PST)
Received: from localhost ([2001:2043:be0a:d700:bd32:e7e3:cfbd:5b51])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8055cf80sm72565191fa.36.2026.11.28.04.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 04:14:49 -0800 (PST)
Sender: Erik <erik88@gmail.com>
From: Erik Cervin-Edin <erik@cervined.in>
To: git@vger.kernel.org
Cc: gitster@pobox.com,
	phillip.wood123@gmail.com,
	Erik Cervin-Edin <erik@cervined.in>
Subject: [PATCH v5 3/3] commit: allow -c/-C for all --fixup variants
Date: Sat, 28 Nov 2026 13:14:02 +0100
Message-ID: <9ab3665cfc381e54b8412c0bb0dae82b72d2d497.1795867565.git.erik@cervined.in>
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

The fixup code path in prepare_to_commit() only knows how to take a
message body from -m or -F.  Now that the previous commit allows -m and
-F for all --fixup variants, -c/-C are the odd ones out.

Teach the fixup path to take the message body from the commit given to
-c/-C, using prepare_amend_commit() as --fixup=amend does when no
message source is given.

The main motivation is consistency: with -c/-C allowed, every message
option works with every --fixup variant, and there's no exception to
document or remember.  Using -c/-C under --fixup is admittedly niche,
but not useless; for example, rewording commit Y based on X's message
after an earlier rebase split X into X' and Y, when Y wasn't reworded at
the time:

    git commit --fixup=reword:Y -c X

Like --fixup=amend, this copies only the body when the source itself is
an "amend!" commit.  Under --fixup the subject is always generated, and
the body of an "amend!" commit is the message intended for its target,
so copying its "amend!" line would leave it in the final message after
autosquash.  This also means that "git commit --fixup=amend:X -C X"
produces the same message as "GIT_EDITOR=: git commit --fixup=amend:X".

Plain --fixup turns the editor off.  Keep it on when using -c, so that
-c isn't silently treated like -C.

The incompatibility check grouping -C, -c, and --fixup can go away
entirely, as -C and -c are already rejected together by the check that
groups them with -m and -F.

Helped-by: Junio C Hamano <gitster@pobox.com>
Signed-off-by: Erik Cervin-Edin <erik@cervined.in>
---
 Documentation/git-commit.adoc             |  9 ++--
 builtin/commit.c                          | 22 ++++++---
 t/t7500-commit-template-squash-signoff.sh | 60 +++++++++++++++++++++--
 3 files changed, 76 insertions(+), 15 deletions(-)

diff --git a/Documentation/git-commit.adoc b/Documentation/git-commit.adoc
index 61efd29e66..98c50a3be5 100644
--- a/Documentation/git-commit.adoc
+++ b/Documentation/git-commit.adoc
@@ -102,8 +102,8 @@ include::diff-context-options.adoc[]
 +
 The commit created by plain `--fixup=<commit>` has a title
 composed of "fixup!" followed by the title of _<commit>_,
-and is recognized specially by `git rebase --autosquash`. The `-m`
-or `-F` option may be used to supplement the log message
+and is recognized specially by `git rebase --autosquash`. The `-m`,
+`-F`, `-C`, or `-c` option may be used to supplement the log message
 of the created commit, but the additional commentary will be thrown
 away once the "fixup!" commit is squashed into _<commit>_ by
 `git rebase --autosquash`.
@@ -112,8 +112,9 @@ The commit created by `--fixup=amend:<commit>` is similar but its
 title is instead prefixed with "amend!". The log message of
 _<commit>_ is copied into the log message of the "amend!" commit and
 opened in an editor so it can be refined. The replacement message may
-also be supplied directly using `-m` or `-F`, bypassing the
-need to open an editor. When `git rebase
+also be supplied directly using `-m`, `-F`, or `-C`, bypassing the
+need to open an editor, or using `-c` to open the editor pre-populated
+with the referenced commit's message. When `git rebase
 --autosquash` squashes the "amend!" commit into _<commit>_, the log
 message of _<commit>_ is replaced by the refined log message from the
 "amend!" commit. It is an error for the "amend!" commit's log message
diff --git a/builtin/commit.c b/builtin/commit.c
index e0fac284bc..2649506828 100644
--- a/builtin/commit.c
+++ b/builtin/commit.c
@@ -827,7 +827,7 @@ static int prepare_to_commit(const char *index_file, const char *prefix,
 			die_errno(_("could not read log file '%s'"),
 				  logfile);
 		hook_arg1 = "message";
-	} else if (use_message) {
+	} else if (use_message && !fixup_message) {
 		const char *buffer;
 		buffer = strstr(use_message_buffer, "\n\n");
 		if (buffer)
@@ -835,12 +835,20 @@ static int prepare_to_commit(const char *index_file, const char *prefix,
 		hook_arg1 = "commit";
 		hook_arg2 = use_message;
 	} else if (fixup_message) {
+		const char *refname = NULL;
+
 		hook_arg1 = "message";
-		if (!strcmp(fixup_prefix, "amend")) {
+		if (use_message)
+			refname = use_message;
+		else if (!strcmp(fixup_prefix, "amend"))
+			refname = fixup_commit;
+
+		if (refname) {
 			struct pretty_print_context ctx = {0};
-			struct commit *c = lookup_commit_reference_by_name(fixup_commit);
+			struct commit *c = lookup_commit_reference_by_name(refname);
+
 			if (!c)
-				die(_("could not lookup commit '%s'"), fixup_commit);
+				die(_("could not lookup commit '%s'"), refname);
 			ctx.output_encoding = get_commit_output_encoding();
 			prepare_amend_commit(c, &sb, &ctx);
 		}
@@ -1329,9 +1337,6 @@ static int parse_and_validate_options(int argc, const char *argv[],
 	}
 	if (fixup_message && squash_message)
 		die(_("options '%s' and '%s' cannot be used together"), "--squash", "--fixup");
-	die_for_incompatible_opt3(!!use_message, "-C",
-				  !!edit_message, "-c",
-				  !!fixup_message, "--fixup");
 	die_for_incompatible_opt4(have_option_m, "-m",
 				  !!edit_message, "-c",
 				  !!use_message, "-C",
@@ -1396,7 +1401,8 @@ static int parse_and_validate_options(int argc, const char *argv[],
 		} else {
 			fixup_commit = fixup_message;
 			fixup_prefix = "fixup";
-			use_editor = 0;
+			if (!edit_message)
+				use_editor = 0;
 		}
 	}
 
diff --git a/t/t7500-commit-template-squash-signoff.sh b/t/t7500-commit-template-squash-signoff.sh
index 9b2ecb1356..04520be0c3 100755
--- a/t/t7500-commit-template-squash-signoff.sh
+++ b/t/t7500-commit-template-squash-signoff.sh
@@ -492,6 +492,62 @@ test_expect_success 'commit --fixup works with -F' '
 	EOF
 '
 
+test_expect_success 'commit --fixup works with -C' '
+	commit_for_rebase_autosquash_setup &&
+	GIT_EDITOR=false git commit --fixup HEAD~ -C HEAD &&
+	test_commit_message HEAD <<-EOF
+	fixup! $(git log -1 --format=%s HEAD~2)
+
+	$(get_commit_msg HEAD~)
+	EOF
+'
+
+test_expect_success 'commit --fixup=amend: works with -c' '
+	commit_for_rebase_autosquash_setup &&
+	GIT_EDITOR="echo edited >>" git commit --fixup=amend:HEAD -c HEAD~ &&
+	test_commit_message HEAD <<-EOF
+	amend! intermediate commit
+
+	target message subject line
+
+	target message body line 1
+	target message body line 2
+
+	edited
+	EOF
+'
+
+test_expect_success 'commit --fixup=amend:HEAD with -C HEAD and without have the same message' '
+	commit_for_rebase_autosquash_setup &&
+	start=$(git rev-parse HEAD) &&
+
+	git commit --fixup=amend:HEAD -C HEAD &&
+	git commit --fixup=amend:HEAD -C HEAD &&
+	git log -1 --pretty=%B >with-c &&
+
+	git reset --hard "$start" &&
+	git commit --fixup=amend:HEAD &&
+	git commit --fixup=amend:HEAD &&
+	git log -1 --pretty=%B >without-c &&
+
+	test_cmp with-c without-c
+'
+
+test_expect_success 'commit --fixup=amend: with -C copies full subject + body of squash commit' '
+	commit_for_rebase_autosquash_setup &&
+	git commit --squash HEAD~ -m "inner body" &&
+	echo "extra" >>foo &&
+	git add foo &&
+	git commit --fixup=amend:HEAD -C HEAD &&
+	test_commit_message HEAD <<-EOF
+	amend! squash! $(git log -1 --format=%s HEAD~3)
+
+	squash! $(git log -1 --format=%s HEAD~3)
+
+	inner body
+	EOF
+'
+
 test_expect_success 'commit --fixup=reword: works with -F' '
 	commit_for_rebase_autosquash_setup &&
 	echo "message from file" >msgfile &&
@@ -553,9 +609,7 @@ test_expect_success 'invalid message options when using --fixup' '
 	echo changes >>foo &&
 	echo "message" >log &&
 	git add foo &&
-	test_must_fail git commit --fixup HEAD~1 --squash HEAD~2 &&
-	test_must_fail git commit --fixup HEAD~1 -C HEAD~2 &&
-	test_must_fail git commit --fixup HEAD~1 -c HEAD~2
+	test_must_fail git commit --fixup HEAD~1 --squash HEAD~2
 '
 
 cat >expected-template <<EOF
-- 
2.56.1.978.gcc9bcf3eaa

