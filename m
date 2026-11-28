Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795868060;
	b=hBvPHliKcpWR3cs9KCtzbGLYRICCmydX6hCRwV//oL1SWttvB4MHRnqR3r1SDRtzNLql
	 L3pFiSsDAFgVVwWV8MBBlzskW0YE6KJyLR056si8RaX0n2Mqn0HRAkfW5oWdPZZO5Qn7c
	 Srpzr2w+gCsHyZOTIMTamyZ9ctrHMhgrnMiPpTHeyZwHgbO7Mrr600dQ8WNIZVWb6IPR4
	 NZoRrFVJzIwW3Fw6GeDUjOP8cAgTXjsiRJyFTW7OVVDtBTHT3Pz40HkmqYZyzjpx7471f
	 eEnhGg2J5ho+2Y5iDeecgmEXBA1pk3OsNHckD+dYePp/3TMTohd6gqqwuIdl9ZzdGbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795868060;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Sender:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CPDs0NzCpHlTNgPyM4e2MnQBRiHe25AjN9yljMTw+s8=;
	b=uvKeyeYhQxtmhC3x0EJTW7BqhNaPTktgqZMDz0X8qILZ5ZEHehXf1IqDIYfru29TZobm
	 SfRiazNCKrgn9AXIolItWWRIHC/neeOFd7oeC7zYOv4HFc7YO/vP5pi6dsNqjUJi79To1
	 HVrNYcVnGrZ4uSzUqV7ZHKeQeYVkjuPQsBlspqjOv5Neyv035sheJ9v+HlLDgz2zhD9HM
	 V1l6PIya2JJaEvbEVDKCIBte74MW07Gmg8zT4srKWbeGHv401gDW8gM4Atj6Da5dAKc2d
	 cwrfLbKuCEON4ugUwt0wEi8P15p2WKX7vwFB4elCrzFN0f/9DISs2iwz/eeaZxa1fAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=cervined.in;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XmIXZqe6;
	arc=none smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4709606A31F
	for <git@vger.kernel.org>; Sat, 28 Nov 2026 12:14:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4709606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cervined.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XmIXZqe6
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5c1a3374400so7220590e87.2
        for <git@vger.kernel.org>; Sat, 28 Nov 2026 04:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795868058; x=1796472858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CPDs0NzCpHlTNgPyM4e2MnQBRiHe25AjN9yljMTw+s8=;
        b=XmIXZqe6BoU0uBWGsTmJxOVqcDs4RB7choRikRjqusq3TPTehwfXKgtwEuBy2zMsP4
         gdrGJmymXhSC7IU1QpvQYqfThc59eubSvx/a8/biQ6It9I1st3ddITIGeQZOASNPS7Fu
         JDkLiHKIeHXRfaQjDjb4a3kO0JLjCwdsW0p3Fnu4B2qQnM63AzUU9Cm7UJWiaMXTKpzC
         MgtOF2V/rCWSBH6twnHL4//gcZedQNf+nG8O1FyMeJPkD2iBsER9RfrWd+epgh7wwaiK
         mD6Dp55583aV2mnWyBoNhkjPzWf5XhswIQ15zZFDuju5TXe3L0Jk23+LWslm4qLZnLk/
         8uTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795868058; x=1796472858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CPDs0NzCpHlTNgPyM4e2MnQBRiHe25AjN9yljMTw+s8=;
        b=mBzmGFBQnqZHvfMIiqO5V5+7mT8MdufgqduhFBUDb6ErJBDJesHXlWRhmehK/jmmt5
         5lJRvoopfJBogrHuoEvAR/En8iQjczExr/F0vvetH/FLrbEyCZG0SNlZrZTmnugcD8IK
         QXZazdKjVtFMcj6+bZnQKyp4iHu9ywApT976iHCgCAt4eiJeOYNT4S0BjbO9mDFr09Vc
         0c6AyB7iy731J21T/OF4tOP0b+LY7/NUpdSf94bScqndHSHRy1flhvY0rprZDQIHKvCq
         OimZghWQ0yuOxtc46AYqMjflYboBKJmMz6vu5lSHDgvDoriojo0oXf2rg48O0s7pKRQo
         q2Qw==
X-Gm-Message-State: APuU4Z+p6jinCc9zZ7dFlbiRaugSyQjxkI3iTzaTmm0b24r6fagR4VDd
	2Ob/xVk4vTchCFyVuVQEi4PbqP9CRb/sMLDVn5NR5fKU+51A9/unONwyOd9mbw==
X-Gm-Gg: AZFdTZdzY7tJg/GJmicrUJN+cJ9/88FRsnYmymdr6NyrCSlP3nb0dKdII/UR5W28cja
	ot9p5AMU4OkYq0GClBeboqMZYcQ9opw82xBpa25VU/99/LUtoAVti3mhszdZNfii14N3ZfDnRNw
	YntJ0wDaRa1mquaKr/fwq6X7blzj6EOa0crQE7U9dlNgWeTi3cBII0KYpkMfkBF6LBe5a7vVuNM
	6e1MO6A0oXSIa5vxhvIg+W1NPzkN7mb+wvbbEdSkqizQfOKtZgsOQNKvpSwwMPjrQnygZ/qDTdp
	Qjht1Ay2f09BLr51HT7FZc4X5AyhxUT9nkLE6KfuiwmsOCQlxgCGkT9aFqOEvG0JEuMDykF2f9O
	HWqwlDbrnWd9WjHr8IRdZaXd3kCQMERoy2tlWCznNkw1buOzq/xEoMdzn7TQZfccFX6lZQyH0Z1
	2h+Tkp1QFwQLaWQ9DSBB7nDY5mvegRUyGeV70mi/z9P3vEUed2/LiDNMQYAaai6fqx00He4CnXh
	zgvkavB1pfe+RxKE/7LUeovASS2RkLqvScimUVrKwWxQgCgKQbgbBFCSMrCCTCg7J1OSv7htphj
	x2vohrgUqhwX5HLC5uREBYuIQOlq/6NZMrx2PZ1LU+0AJ/o4x14O0pHnd2zCu3Sv+wdOnSOS//F
	z3467DhBeMZtMFX2ClhnUdXi2phVMVevPdBJP0OEOvdoKCQ==
X-Received: by 2002:a05:6512:33d0:b0:5c1:57dd:513e with SMTP id 2adb3069b0e04-5c1bc80ece4mr8230607e87.42.1795868057587;
        Sat, 28 Nov 2026 04:14:17 -0800 (PST)
Received: from localhost ([2001:2043:be0a:d700:bd32:e7e3:cfbd:5b51])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd064420sm6592431e87.71.2026.11.28.04.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 04:14:17 -0800 (PST)
Sender: Erik <erik88@gmail.com>
From: Erik Cervin-Edin <erik@cervined.in>
To: git@vger.kernel.org
Cc: gitster@pobox.com,
	phillip.wood123@gmail.com,
	Erik Cervin-Edin <erik@cervined.in>
Subject: [PATCH v5 0/3] commit: allow -m/-F/-c/-C for all --fixup variants
Date: Sat, 28 Nov 2026 13:13:56 +0100
Message-ID: <cover.1795867565.git.erik@cervined.in>
X-Mailer: git-send-email 2.56.1.978.gcc9bcf3eaa
In-Reply-To: <cover.1795562078.git.erik@cervined.in>
References: <cover.1795562078.git.erik@cervined.in>
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

Changes since v4:

  * 3/3: plain --fixup -c now opens the editor, as -c does everywhere
    else.  v4 kept plain --fixup's existing no-editor behavior, which
    meant -c silently acted like -C.

Background
----------

Today only -m works with plain --fixup, and neither -m nor -F works
with --fixup=amend: or --fixup=reword:, which makes those modes
awkward to drive non-interactively.

  * 1/3 is a preparatory refactor that writes the --fixup subject before
    choosing the message source, like --squash does.

  * 2/3 lets -m and -F supply the message for all --fixup variants.

  * 3/3 does the same for -c/-C, so that all four message sources behave
    consistently across the plain, amend, and reword forms.

As in v3 and v4, -c/-C go through prepare_amend_commit(), so if
the source commit is itself an "amend!" commit, its subject line is
dropped and only the body is copied.  This is what a no-source
--fixup=amend:<commit> already does.  The helper only knows about
"amend!" and not "fixup!" or "squash!"; that is pre-existing and I have
left it alone here.

The earlier rounds are described in the v2 [1], v3 [2] and v4 [3]
cover letters.

[1] https://lore.kernel.org/git/cover.1779792311.git.erik@cervined.in/
[2] https://lore.kernel.org/git/cover.1790082176.git.erik@cervined.in/
[3] https://lore.kernel.org/git/cover.1795562078.git.erik@cervined.in/

Erik Cervin-Edin (3):
  commit: write the --fixup subject the way --squash does
  commit: allow -m/-F for all --fixup variants
  commit: allow -c/-C for all --fixup variants

 Documentation/git-commit.adoc             |  22 +++--
 builtin/commit.c                          |  64 ++++++------
 t/t7500-commit-template-squash-signoff.sh | 114 +++++++++++++++++++---
 3 files changed, 140 insertions(+), 60 deletions(-)

Range-diff against v4:
1:  ebae1fbe05 = 1:  ebae1fbe05 commit: write the --fixup subject the way --squash does
2:  051b659965 = 2:  051b659965 commit: allow -m/-F for all --fixup variants
3:  159a56c510 ! 3:  9ab3665cfc commit: allow -c/-C for all --fixup variants
    @@ Commit message
         autosquash.  This also means that "git commit --fixup=amend:X -C X"
         produces the same message as "GIT_EDITOR=: git commit --fixup=amend:X".
     
    -    Plain --fixup never opens an editor, so -c there behaves like -C.
    +    Plain --fixup turns the editor off.  Keep it on when using -c, so that
    +    -c isn't silently treated like -C.
     
         The incompatibility check grouping -C, -c, and --fixup can go away
         entirely, as -C and -c are already rejected together by the check that
    @@ builtin/commit.c: static int parse_and_validate_options(int argc, const char *ar
      	die_for_incompatible_opt4(have_option_m, "-m",
      				  !!edit_message, "-c",
      				  !!use_message, "-C",
    +@@ builtin/commit.c: static int parse_and_validate_options(int argc, const char *argv[],
    + 		} else {
    + 			fixup_commit = fixup_message;
    + 			fixup_prefix = "fixup";
    +-			use_editor = 0;
    ++			if (!edit_message)
    ++				use_editor = 0;
    + 		}
    + 	}
    + 
     
      ## t/t7500-commit-template-squash-signoff.sh ##
     @@ t/t7500-commit-template-squash-signoff.sh: test_expect_success 'commit --fixup works with -F' '

base-commit: f7de81456940dd6f3274e461149bba12965de609
-- 
2.56.1.978.gcc9bcf3eaa
