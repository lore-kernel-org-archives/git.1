Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795868072;
	b=n+MftcetRkK5HGDO79U4eYewJ78jrgTkeyEsWHvHx2I5O0oqsjv+cEW1rDByWrwT84w4
	 rUOUcjUIAL+JGoD+NqALl6NjmpkG1OpsjIZtaaFiKtUFoWkYrbK7sfsXNNgzLeeeS0EBA
	 LUKwEhXCzcfVwiQW+2DkQHapoGrhNii/W8uCELvTYdCFnEDNvEKfpzaooNSa06BVXWgSe
	 B7Hl62pGVm62YIvJ3N1XU6S2UM/WhiqsdAFgkYP3QQuxq96STesyTIi0aRFN1Nmz32Ruu
	 Ji4onzp2gXTLr2QUQA6uvRyrcyrNECob598Bk+EOggkMm0N8/qmhdNpNlJ74GQ38XWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795868072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Sender:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NnTde1OYlbt5Rck9PAQS5KiWaQlvV0FJK0Qswqq3EIw=;
	b=NmwH8JwqH5wSQe2uzACFcxU9YC8rO4XPGDc7REDJSQpgjzOC9agbMr/kuDW9VnXZRPfg
	 u96kQg+04MEuNL+OCxdN5q5rSK8ch3Hn/zz1nrQ8v5MZwF2I11zODJYMDOuLyOhJSUbeo
	 ympbLS0I11allAL+W78eTwKL2bbBVG8KtVANk8nfKMUxbYsva/2glzPu2vKVf3NCGp5g7
	 yflqwEAUGDxWF7rk2Z07TS425buUL61GKajWcJ5MOd/3R+XEQVujmZ+VjpFjqsfd8ZVE+
	 ZN1n3fKAQ7rd6h76ZnEY8Rkb9rRmiKQ3C1nzQlj0Z5CXfbiO1tcPiADAalNnRIPEiNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=cervined.in;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yHIyPpSq;
	arc=none smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBEF606A321
	for <git@vger.kernel.org>; Sat, 28 Nov 2026 12:14:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FBEF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cervined.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yHIyPpSq
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c0a520df2eso8738315e87.0
        for <git@vger.kernel.org>; Sat, 28 Nov 2026 04:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795868070; x=1796472870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NnTde1OYlbt5Rck9PAQS5KiWaQlvV0FJK0Qswqq3EIw=;
        b=yHIyPpSqWcNGZojul9YfTcOoxidq/ofbUb0RErb91fvu1enT0vIK/3ROcNcHAGduDH
         4yp+lDlGRiPnkU8sRsb0/W8H4o6/1JIpSYUxzU7omM4UP4GXhR3f5VRtX2PLLDp8WSRs
         fdUeekkXjmHIhMQ6XRpcQVnE/gQRq5Ct3qGZpkO9fKUQ7akV+PDOSRIFb+moONhRkXJ4
         d3WqXyz5N6HuRnJG0SFuq7Gk7uxkHQPT+WDBlNzDzCFZRaIw/B7Fx2DEIllyX/CjT1Tz
         O9N2F/x/MMszL9uNIwJFp3rSv1co/poiDL0Vqm30rwygDPohpwIWPAzEEEdAdceqd1DC
         08rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795868070; x=1796472870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NnTde1OYlbt5Rck9PAQS5KiWaQlvV0FJK0Qswqq3EIw=;
        b=TbBOW9b007VY1pU8tetxg7D5Plp9HFV0XRHAAVkL8wxZLzsbVi6SiBgOWZZgKr+rvK
         lmd0itQutwbKYtRZ58zz5TyFo1STGmRWMFPofRnrwVOqixhajjjaxBVti7f1mVxK1OLx
         o1SDZbnvTwWeN/uuX7yv7U7rsDmoF9Vt3mFy4IF6Tm3P8SNj+KdYj2cneScU4j52zKV5
         yGqOuH17lrIFBeG63ABl6WxcDjVHFlWmt5MHP1F+brAWpJ+M620/c6Pgy9p+DJXalW+w
         3jRZ+HPv4pvCXd2cJcePaZYc1v9c+Gc51qJfBGvTQevGKKSjTBUY9qTmNv3Ci/o9wwZR
         tWvg==
X-Gm-Message-State: APuU4Z8IAbNK8jKSyD+zJdVqSkxw1LDQs5mo2PhJtI7nF3X9ASG1Eid2
	nFUXpcY/Va8mnvYuUBXnCpOFL1wsuBrRpoRGtu1v6si2Bc9pyquQ0MbhVIQIqQ==
X-Gm-Gg: AZFdTZfFhIaQ72kKo8kKROXWsxyyEyR6EoyoSYLpwZ7e2n6HZB9kydzAvS8LhasM+N0
	4LZSg0FKoel21vHgBd6q3/wh0gF5/fozoo8Ll6ch6VS/WgP2Oy2SmyahkApbd4iuk/lJ49MwrL5
	375dh+HF/4GrSnjvzxRuN+u5y/VtZAS8FEHBv7P9aArRDLqtnvj2sD7dhfkCVt4aow/7SCzdCJu
	OANg9F1aXiuX5dsrZrGh9BFeHlY9ZScQ3nyGoUDt3/ul0soIWE7HZye3ZErJwzfA1j6+tjADHGF
	3nTLCpN3f9SyInJ9q5pklejGT0O2Ab9Cs13IwgzX5CT+/d49eCbcVEXW7QwkvvgI4yJ2IRtuSfq
	F47kY7Mr0NPqJPTNFATCvxzOaBtlMpnv3V3eyPZ8WewFKSMd/6fN83AtKrCh9PaddNMIrqQ/OHC
	b15sKzGkwDV5jM65t/LBTj4JJwaIn60IPdcuUZJBV4rSlbpuJjzMxteeVB8xvC2udB7TFMU5CBS
	qPpLJR0PgxMsAa4QZtjOKwDa1FBDfZH0Fv8I7wqZhKXBxsmBp+/9vqKVILDIEaBO2wGldtyHxp8
	S8iWMN33Bn5kC7zhiQB+9ycwRpPLz5b7aC6WiXdNYNMz9RfCgudZZGCrf7Iwf9H36lct7DnMFwA
	qc20jLZtqqkqpkxlCrikadRidieI379172dXSgEpTM/CeRg==
X-Received: by 2002:a05:6512:3f0c:b0:5c1:488e:a069 with SMTP id 2adb3069b0e04-5c1bc847aa8mr9901047e87.13.1795868069990;
        Sat, 28 Nov 2026 04:14:29 -0800 (PST)
Received: from localhost ([2001:2043:be0a:d700:bd32:e7e3:cfbd:5b51])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd0419c2sm6491289e87.52.2026.11.28.04.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 04:14:29 -0800 (PST)
Sender: Erik <erik88@gmail.com>
From: Erik Cervin-Edin <erik@cervined.in>
To: git@vger.kernel.org
Cc: gitster@pobox.com,
	phillip.wood123@gmail.com,
	Erik Cervin-Edin <erik@cervined.in>
Subject: [PATCH v5 1/3] commit: write the --fixup subject the way --squash does
Date: Sat, 28 Nov 2026 13:13:58 +0100
Message-ID: <ebae1fbe0586bc3c396c26aaf044149a0b9a16bb.1795867565.git.erik@cervined.in>
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

In prepare_to_commit(), the source of the message is chosen by an
if/else-if chain, one arm per option.  Originally [1], when using
--fixup you couldn't specify a message source, but then [2] taught
commit how to combine --fixup with -m.  Since then, the -m arm is
skipped for fixup commits and instead the fixup arm writes the
"fixup!" or "amend!" subject, appending any -m messages to a "fixup!".

Unlike --fixup, --squash has supported all message source options since
it was introduced [3].  It writes its "squash!" subject first and then
lets the chain write the rest of the message.

Two commits that follow teach commit --fixup how to take messages like
--squash.  In preparation for that, refactor prepare_to_commit() to
write the --fixup subject in a block before the chain, as --squash does.
Since the two options are mutually exclusive, put each subject block in
its own branch of an if/else-if.

The fixup arm is left with the one message source that takes no
command-line option: an amend, which supplies the message by opening
an editor prefilled with the fixup target's message.

The -m arm now runs before the fixup arm, so the error for -m with an
amend would never be reached there.  Raise it in the subject block.

While moving the subject code, rename its "commit" variable to "c" to
match the --squash block.

1. d71b8ba7c9 (commit: --fixup option for use with rebase --autosquash,
   2010-11-02)

2. 30884c9afc (commit: add support for --fixup <commit> -m"<extra
   message>", 2017-12-22)

3. 89ac1223c0 (commit: --squash option for use with rebase --autosquash,
   2010-11-02)

Signed-off-by: Erik Cervin-Edin <erik@cervined.in>
---
 builtin/commit.c | 51 +++++++++++++++++++++---------------------------
 1 file changed, 22 insertions(+), 29 deletions(-)

diff --git a/builtin/commit.c b/builtin/commit.c
index 36e47e18ed..698823d4fa 100644
--- a/builtin/commit.c
+++ b/builtin/commit.c
@@ -781,7 +781,21 @@ static int prepare_to_commit(const char *index_file, const char *prefix,
 					  "pre-commit", NULL))
 		return 0;
 
-	if (squash_message) {
+	if (fixup_message) {
+		struct pretty_print_context ctx = {0};
+		struct commit *c;
+		char *fmt;
+		c = lookup_commit_reference_by_name(fixup_commit);
+		if (!c)
+			die(_("could not lookup commit '%s'"), fixup_commit);
+		ctx.output_encoding = get_commit_output_encoding();
+		fmt = xstrfmt("%s! %%s\n\n", fixup_prefix);
+		repo_format_commit_message(the_repository, c, fmt, &sb,
+					   &ctx);
+		free(fmt);
+		if (have_option_m && !strcmp(fixup_prefix, "amend"))
+			die(_("options '%s' and '%s:%s' cannot be used together"), "-m", "--fixup", fixup_message);
+	} else if (squash_message) {
 		/*
 		 * Insert the proper subject line before other commit
 		 * message options add their content.
@@ -801,7 +815,7 @@ static int prepare_to_commit(const char *index_file, const char *prefix,
 		}
 	}
 
-	if (have_option_m && !fixup_message) {
+	if (have_option_m) {
 		strbuf_addbuf(&sb, &message);
 		hook_arg1 = "message";
 	} else if (logfile && !strcmp(logfile, "-")) {
@@ -823,35 +837,14 @@ static int prepare_to_commit(const char *index_file, const char *prefix,
 		hook_arg1 = "commit";
 		hook_arg2 = use_message;
 	} else if (fixup_message) {
-		struct pretty_print_context ctx = {0};
-		struct commit *commit;
-		char *fmt;
-		commit = lookup_commit_reference_by_name(fixup_commit);
-		if (!commit)
-			die(_("could not lookup commit '%s'"), fixup_commit);
-		ctx.output_encoding = get_commit_output_encoding();
-		fmt = xstrfmt("%s! %%s\n\n", fixup_prefix);
-		repo_format_commit_message(the_repository, commit, fmt, &sb,
-					   &ctx);
-		free(fmt);
 		hook_arg1 = "message";
-
-		/*
-		 * Only `-m` commit message option is checked here, as
-		 * it supports `--fixup` to append the commit message.
-		 *
-		 * The other commit message options `-c`/`-C`/`-F` are
-		 * incompatible with all the forms of `--fixup` and
-		 * have already errored out while parsing the `git commit`
-		 * options.
-		 */
-		if (have_option_m && !strcmp(fixup_prefix, "fixup"))
-			strbuf_addbuf(&sb, &message);
-
 		if (!strcmp(fixup_prefix, "amend")) {
-			if (have_option_m)
-				die(_("options '%s' and '%s:%s' cannot be used together"), "-m", "--fixup", fixup_message);
-			prepare_amend_commit(commit, &sb, &ctx);
+			struct pretty_print_context ctx = {0};
+			struct commit *c = lookup_commit_reference_by_name(fixup_commit);
+			if (!c)
+				die(_("could not lookup commit '%s'"), fixup_commit);
+			ctx.output_encoding = get_commit_output_encoding();
+			prepare_amend_commit(c, &sb, &ctx);
 		}
 	} else if (!stat(git_path_merge_msg(the_repository), &statbuf)) {
 		size_t merge_msg_start;
-- 
2.56.1.978.gcc9bcf3eaa

