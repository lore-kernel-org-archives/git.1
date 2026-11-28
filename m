Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795877901;
	b=5lEqEj+QL0gUv4qJXvzuF5IhCvIQMgvdXLJT9jzv2P/wx2dSt9lB5QdlwbABLwHE2f/j
	 2B91S/8aAuMGDVtT+Y5J2jzND+UWT1iguNtXSVtDQaWXipJLtNQwu98EIoVhw0Cf6uws8
	 omEkDq7M4sZpThWrd2eQoBobo3TKIuvBQjECeSJYa65cmAD1Fe3u9QB8QVAwUM8QHzwvL
	 TLAmauipYCXOlWaaa2IeTASjDgXwCZHKhl5lVzjV/L29Wnj4qnvtHR2D/kzqxXBETB1h7
	 YCOVqWrcpGFwpfy8ijo06YqIh/L9pck3M9IYrpahIKMmJnN0kYAT2UnWyRX7sr5gAJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795877901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=ORw2iJc39BVRpt308xBojJicoqGaVg/DXwt7zp5kj8E=;
	b=oxSeVQDT8BKoArziLzlElNbnPeWYHvzgMYQ9D6thIYMsqwMhMj/TbbLFXrFicw8WBLTv
	 7fvAwQJZy7u6OcspwEtbhpjxqobiwvGqFC6kwhIN2YYSuheGuTIstYaJFtKwbrQql3bTQ
	 k6Fa9xcqn6IPzQ2nD3C/0Jbml8UMnQIjw20mE2TVmFLUbJ/PhSIsRoaZlLsJGd89n36f6
	 KzdeNplNNwS2oYl9SQdDgqpnun49wpuz9sB81dSVNwZp9ZbxM12kDIm+Ulj+bR+xDZDuX
	 lKrC1MuiHvbCnTHXo6FF2eKje6F+XFX/nGVgOMeTRgPTCJvRu57Fk+FTrbw6SPf02tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VKKUsI9g;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C08606A32C
	for <git@vger.kernel.org>; Sat, 28 Nov 2026 14:58:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09C08606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VKKUsI9g
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15ea896ddc8so14748528c88.0
        for <git@vger.kernel.org>; Sat, 28 Nov 2026 06:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795877900; x=1796482700; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ORw2iJc39BVRpt308xBojJicoqGaVg/DXwt7zp5kj8E=;
        b=VKKUsI9g+Dumf66DB/Ax9sh9o72O3E5EJkOWkbWrci+njyBXp6S4Xlh150TZv+Z+Yy
         YtJGgCEhKds+M9oza1kacAohU1XIhrckCna89pWAEUpDmxP/vx43IjkELTbYyj9xKMCe
         BNBbJSLvfRxiTsh3YtdIwVIeqBcqFZbFtQLQ+KLaNN8XJqX+RH9WFK9WD7gma3bz5+Mw
         TWesD6Pf9no15QKuu/qfd8x5OicoxVua5al+S6yj/UHtJQbVRp9aAKkAvCqTALtFchKb
         mhk06lqvvhnTytZO61thxbVEchpRqJsocIM840MRwj0V/vNdPf45ZuJwsNH+2Au+MfaY
         3O5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795877900; x=1796482700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ORw2iJc39BVRpt308xBojJicoqGaVg/DXwt7zp5kj8E=;
        b=fxvqoKWS3TbK0DnNHFRRNNfSTaVW7aM0qI4CiYjKQuVlBpQtAQAO8b6KQcCYbsyLoq
         zFKHbCg6EQGSV4NUDkc64D/j5te5qkQmBwLV/zvm7a9hNEg4o4UW5yoHTvScsK4v70L/
         uDfn2KGO4GHLu9DmKURqPjZo7oHPeIlDviSiWP4luGqI1aZ9kNiHTCQALXUi7+A8TxNN
         n34oAXzKejxCv0wXMGA/fYpzOzzQCq623NQHbbJaFikFG2CEpiXAffeMlbXCw+FrUjNl
         z2RAnD0fjQbAoMDkLb0U2mBSNnlscVajqCYmsq1lbrbwxRFeeyeVWh0CeJ1gvuWjBGzc
         AcOQ==
X-Gm-Message-State: APuU4Z8h6Z26YKZIWgUXMFFMQynY2hfXwMWDIwlw+jSWNMeDzDJo3y9L
	i6nrKM+6bVdKH2CY+r78IPgxljkYpovtDBHj37LUooBe8rmRRYxtj9dz
X-Gm-Gg: AZFdTZehjcmrKqGH6RXlw8aEObO2yBiNvCYspaw+w4lPKZLCa//cIrK4ptSeIVyE8hP
	zu3R8FPbYA8uPxgi5lbAbx0+XNIgItYZZA24Xk1319qTlFAELPDHl4PDK4y3nvGQh3IbmyQcKy3
	ZYIlJH2ZEi5OKFsGgNcKXNs4OlxuEO0oRY6lrgiRZxCor7lEe76cGDFduK/n8H3pe0uziqagUqp
	+2C4IjX4QfayO5CaZiPiIzYiD+lUH7frCKWv//adt46PsmF2A29022ZEC7QDrTe1wLvbokGviap
	yCguqfjTS4HeiYZAmubrk1JtFQXcYNABbu+qzRPDa4f/HnrW+rH3FO03Tx0rVb0+aKIwxEOw+z6
	mrPRAjysbKEDqZun7cxuoaJYQ8Z50gsLGG/NDowBw/qgQDVVkLQ93Txij59g+c2F8kiO2Fz2UYM
	6w8onTalHMITMWo1xxY7//lpWs1yS6gtAdrBSoGpIHejNnj43Wh6udA7eC0UrDcmSbZbfuGquci
	7UOQGp2gVDkZ1JO9TX6tZwVrdiQM+eJ4r0Ykl3KDyoy1pA37plyIF5L8CI+XEZ7kv5+f9f3gDuD
	4QoPu1nyq9QpXfqvQ3N97J5rrSHo4p33xZ2lJg==
X-Received: by 2002:a05:701b:4193:10b0:144:eaa7:2763 with SMTP id a92af1059eb24-1b55689a0fcmr28400213c88.16.1795877899987;
        Sat, 28 Nov 2026 06:58:19 -0800 (PST)
Received: from [127.0.1.1] ([2406:7400:12b:ed80:cd5:5f99:c548:8028])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm58322930c88.4.2026.11.28.06.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 06:58:19 -0800 (PST)
From: Kaartic Sivaraam <kaartic.sivaraam@gmail.com>
Date: Sat, 28 Nov 2026 20:28:00 +0530
Subject: [PATCH v4 2/2] t0000: test taking over and releasing the EXPENSIVE
 lock
X-Mailing-List: git@vger.kernel.org
List-Id: <git.vger.kernel.org>
List-Post: <mailto:git@vger.kernel.org>
List-Help: <mailto:git+help@vger.kernel.org>
List-Subscribe: <mailto:git+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:git+unsubscribe@vger.kernel.org>
List-Owner: <mailto:git+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261128-ks-ci-long-test-hang-fix-v4-2-f117badd2e13@gmail.com>
References: <20261128-ks-ci-long-test-hang-fix-v4-0-f117badd2e13@gmail.com>
In-Reply-To: <20261128-ks-ci-long-test-hang-fix-v4-0-f117badd2e13@gmail.com>
To: Git mailing list <git@vger.kernel.org>
Cc: Harald Nordgren <haraldnordgren@gmail.com>, 
 Junio C Hamano <gitster@pobox.com>, Patrick Steinhardt <ps@pks.im>
X-Mailer: b4 0.16.0

The previous commit serializes EXPENSIVE tests with a lock that a
waiter takes over when its holder was killed, and that the EXIT trap
releases when a script dies while holding it.

Add subtests checking that:

  - a lock left by a dead process is taken over, held while the test
    runs, and released afterwards;

  - a lock carrying the script's own PID, which can only be left by a
    dead holder whose PID was reused, is taken over;

  - a script exiting in the middle of an EXPENSIVE test does not leave
    the lock behind.

None of them has to wait, as a stale lock is cleared without polling.

Signed-off-by: Kaartic Sivaraam <kaartic.sivaraam@gmail.com>
---
 t/t0000-basic.sh | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/t/t0000-basic.sh b/t/t0000-basic.sh
index 7bd1f4e7b7..1535b7aa7e 100755
--- a/t/t0000-basic.sh
+++ b/t/t0000-basic.sh
@@ -746,6 +746,54 @@ test_expect_success 'subtest: lazy prereqs do not turn off tracing' '
 	test_grep "echo trace" lazy-prereq-and-tracing/err
 '
 
+test_expect_success 'subtest: EXPENSIVE lock of a dead holder is taken over' '
+	write_sub_test_lib_test expensive-lock-dead <<-\EOF &&
+	test_expect_success EXPENSIVE "holds the lock" "
+		echo $$ >expect &&
+		test_cmp expect \"$TEST_RESULTS_DIR/expensive.lock\"
+	"
+	test_done
+	EOF
+	mkdir expensive-lock-dead/test-results &&
+	sh -c "echo \$\$" >expensive-lock-dead/test-results/expensive.lock &&
+	run_sub_test_lib_test expensive-lock-dead --long &&
+	check_sub_test_lib_test expensive-lock-dead <<-\EOF &&
+	> ok 1 - holds the lock
+	> # passed all 1 test(s)
+	> 1..1
+	EOF
+	test_path_is_missing expensive-lock-dead/test-results/expensive.lock
+'
+
+test_expect_success 'subtest: EXPENSIVE lock carrying our own PID is taken over' '
+	write_sub_test_lib_test expensive-lock-own-pid <<-\EOF &&
+	mkdir -p "$TEST_RESULTS_DIR" &&
+	echo $$ >"$TEST_RESULTS_DIR/expensive.lock"
+	test_expect_success EXPENSIVE "takes the lock" "true"
+	test_done
+	EOF
+	run_sub_test_lib_test expensive-lock-own-pid --long &&
+	check_sub_test_lib_test expensive-lock-own-pid <<-\EOF &&
+	> ok 1 - takes the lock
+	> # passed all 1 test(s)
+	> 1..1
+	EOF
+	test_path_is_missing expensive-lock-own-pid/test-results/expensive.lock
+'
+
+test_expect_success 'subtest: EXPENSIVE lock is released when exiting mid-test' '
+	write_sub_test_lib_test expensive-lock-exit <<-\EOF &&
+	test_expect_success EXPENSIVE "exits holding the lock" "
+		test_path_is_file \"$TEST_RESULTS_DIR/expensive.lock\" &&
+		exit 1
+	"
+	test_done
+	EOF
+	run_sub_test_lib_test_err expensive-lock-exit --long &&
+	test_grep "FATAL: Unexpected exit" expensive-lock-exit/out &&
+	test_path_is_missing expensive-lock-exit/test-results/expensive.lock
+'
+
 test_expect_success 'subtest: tests clean up after themselves' '
 	write_and_run_sub_test_lib_test cleanup <<-\EOF &&
 	clean=no

-- 
2.56.1.911.g883d8bcb20

