Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795877899;
	b=Rzjhja6ISKNvCSz+9+KnFe1+C/CZH5ksCoFeGBJ5IF43yWFxn2sfIZlhiXQUG8iX42I3
	 R11PxGV4xhZYXh8uiytj0wwOwBmYmLXY/gPAhl9mYEt0d2VJreQ/fJmXj0EmxXamF80/t
	 tYdM87YYq/ZEholKPcnbMs4BtSTmhZBQjSu4ZGMACC3H14GiuZJ/uK/LTQYtl+/Ltlffy
	 HhUP855OQP0JKYfXWsBRAgtBZeKvwIuk1tJiHAeDt1uCDHaOUXp3ESKjqfkWKNHcO0Dx9
	 u2BExib9rgoC0PdrnuJE0EO4fom8auVd7KkP0hf7Qr0f9P/rfSkXlSzNgyyEIo5Shpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795877899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=zyCuG3BS5TThIqlgA8obclPrCp0ki9OpUa9KghHdkp4=;
	b=POKe6BkypkvwyL+1mwQlTZLiX0tidVZGNxD2Idzm7CSzEc3xsTQ7n6T8z4OnLh3j/ZdL
	 JqhrDkqOoJ6y7Rmi6TGfk9gP8oHVm9oThG8QXZIaFDVPLOytXLNfyDjDRCywxisXLpXUO
	 nj9gGlu/ZSKe2R7QzqBIE0Ayw5PIXgwL3mcENLz3XRTwf3upE3OXKUVMWE4HzDYszm8hl
	 p/ZkFjAwV4D787D73nX7z3x4O2/kf4cAYXj8pWvsS0bMqqcp7iRFQvbFrq1IivqhuckQy
	 Ei4Tfwt7/PcVlXiXt6wwIZ87iF0LH+TAGMymX37jsbQuUKmxOmYYBSFVXwPcgeRjQUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mTDEg4ol;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CB8606A321
	for <git@vger.kernel.org>; Sat, 28 Nov 2026 14:58:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3CB8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mTDEg4ol
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b546061d58so241401c88.1
        for <git@vger.kernel.org>; Sat, 28 Nov 2026 06:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795877898; x=1796482698; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zyCuG3BS5TThIqlgA8obclPrCp0ki9OpUa9KghHdkp4=;
        b=mTDEg4ol1YPh+xMXofiG8YWLyY20Jv5Ftbp+qll8q0P7sc/CFkbOiZyMo/3QvuUdGd
         NIKRLY3wPh3/AjiyFIrVK47vOqygi4AN0Ob6Vxk0++5IixQjgO51n9cymOVk4VPo/PPc
         DugAGDeDLzPpp8/1X9EZXUfiExJ1psAif0G3+us5DvqfGoUy62TanTh5hK1YfWPno8sj
         pS+dbNBB++3TH2zypz3f9w2iLhjMkldmTlg5MesQ8z7UKsm8IYWC/LBytEe/Kgek6JiY
         viuReu0BjFSX4jUQjQ/sSHQ0cqB2qM7Y268p6IhS4GomkxPg8X7v3CMYAzc0EBGwWgzN
         Ld1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795877898; x=1796482698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zyCuG3BS5TThIqlgA8obclPrCp0ki9OpUa9KghHdkp4=;
        b=IOmXfR5Zdvjc1A9jWYfa2wGjoex+OcduRzrKdHfrajM0IixUnEiJtVk2rRLzVL8oj8
         Lw0WftICoO3sGIN4/1oAjDIxKDTFBofZacoymoWpsrS9p04aqCPwdxjQaCytAE0bKI40
         fqqu8KetFC1fq1ditzTRWW41Qn5w/+MJCvLZ2/AhUqk62gc9hyWCxi1nb5U8AV/N8gSO
         Lu4xj8Z1fEhCgEpnkpBYcf55091FlR2E6roeEYk2HzBmWbkPSRKvlsG9drgFxqbF0IdE
         /TQedFgIWwATvCyc5c8CORPj8omFL/ElfinZgkaTB1qKQCOFxzZsCrHvxhooPseDJrmv
         RZTQ==
X-Gm-Message-State: APuU4Z9rN8i2BHlZmoz7GC8xHUsBKnG5+9fSV2BoDfIOG830nznrq7gY
	ZdPae3mvuV6n+/LJFzArC7tBItlNexzMEAvCeE1WDVjx4CO/Ja9pv6NZ
X-Gm-Gg: AZFdTZeFIEdT+4LbA1IeoKlSu0pbKVGo+YPdffcVsq28bi4et9Vd4rneFXF1RItB7/z
	ywrp+vR+RQjcMyw3fcphRmgdoLGRJTuuXhQf3BRxQ44TtSZCRpnlWcJnrA6Lok/HKgm1Zybndty
	zMJjbvmm+VwoA45TGeTocjN1vuwmT5MSRjsvvelSEif7jlyYwSntMcrCBaRES5xjyoIJJg/XE2U
	YUoUmrqsvOuz2ObjwicfOd2Gr09kVdrXi2E0r3t1xoGSrNIr2zaHQhtjEFhTTssIEB5YSm1G44+
	4bqdykzqcuW9VC7cncxFR5JrZecJHgIL/mACxMkFvKBl/k5Vs17I61Qga4gyeA3hdLEYzwFjr/n
	qeJjy8Uqv82GX6DPbQho66X0+axNBdimOLEnFbOGFcky8UqKrw+i1th+JpPsBfz6cwDxY5fPFyY
	DdUmb1ICL18AK7H9Z6aH4oryDh9GpbmAWi/6g5GmhcI1QRMNlk6g1V3QdCEi0dhi3s79SxZu78i
	YIAB7XzyJubZmQuGQ6i+JEUj7iABLLVfyourTJVYIHsykjo6bCL7Wb7bkGUSXanPGX98CS92uDT
	2IZe2ytqRnWg6Q8Ffdo8uQO7yZ1NHEYOKnHWxw==
X-Received: by 2002:a05:7022:150e:b0:1ac:9da7:e881 with SMTP id a92af1059eb24-1b55690bc2fmr29592288c88.36.1795877897759;
        Sat, 28 Nov 2026 06:58:17 -0800 (PST)
Received: from [127.0.1.1] ([2406:7400:12b:ed80:cd5:5f99:c548:8028])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm58322930c88.4.2026.11.28.06.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 06:58:17 -0800 (PST)
From: Kaartic Sivaraam <kaartic.sivaraam@gmail.com>
Date: Sat, 28 Nov 2026 20:27:59 +0530
Subject: [PATCH v4 1/2] test-lib: run EXPENSIVE tests one at a time
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
Message-Id: <20261128-ks-ci-long-test-hang-fix-v4-1-f117badd2e13@gmail.com>
References: <20261128-ks-ci-long-test-hang-fix-v4-0-f117badd2e13@gmail.com>
In-Reply-To: <20261128-ks-ci-long-test-hang-fix-v4-0-f117badd2e13@gmail.com>
To: Git mailing list <git@vger.kernel.org>
Cc: Harald Nordgren <haraldnordgren@gmail.com>, 
 Junio C Hamano <gitster@pobox.com>, Patrick Steinhardt <ps@pks.im>
X-Mailer: b4 0.16.0

Recently, we've acquired quite a few expensive tests in our test suite.
For instance, these commits add several tests that require
multiple gigabytes of memory:

  - 89048b48fb (t1600-index: add expensive tests for over-long
    tree paths, 2026-10-16) added tests to t1600

  - 288266c11d (xdiff: use size_t for merge buffer size computations,
    2026-10-16) added tests to t4300

  - 55c54fd375 (apply: reject binary patches greater than MAX_APPLY_SIZE,
    2026-03-25) added tests to t4141

We also have the memory hungry 5GB filtered hash-object test in t1007.

When GIT_TEST_LONG is set, "prove --jobs" happily runs several of these
at once. On the 16GB GitLab CI runners this exhausts memory: the
sanitizer jobs have been hanging in t1007 until they hit the job
timeout ever since the new EXPENSIVE tests in t1600 started running
alongside it. Running the two under a 16GB memory cap reproduces it,
with the t1007 git process getting OOM-killed.

GitHub CI runners are no exception and experience the same behaviour.

Take a lock shared by all test scripts around each EXPENSIVE test, so
only one of them runs at a time. Cheap tests in the same scripts keep
running in parallel. Only the expensive ones wait for each other.

The lock is a file in TEST_RESULTS_DIR holding its owner's PID. A
script writes its PID to a file of its own and hard links it into place
with ln(1). Like mkdir(1), that is atomic and fails if the lock exists,
but the lock never exists without its owner recorded in it.

The lock is released after the test and its cleanup finish, and from
the EXIT trap. A lock whose owner is gone was left by a killed script,
and a waiter removes it after re-reading it, so that a lock another
waiter has just taken is left alone. Two waiters clearing the same
stale lock at once may let two expensive tests run together, which is
rare and better than hanging. If the lock cannot be taken although
nobody holds it, e.g. without hard link support or on a read-only or
full disk, the test runs anyway.

Signed-off-by: Kaartic Sivaraam <kaartic.sivaraam@gmail.com>
---
 t/README      |  8 +++++-
 t/test-lib.sh | 83 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 90 insertions(+), 1 deletion(-)

diff --git a/t/README b/t/README
index fd7e8504b5..824783acfa 100644
--- a/t/README
+++ b/t/README
@@ -117,7 +117,13 @@ appropriately before running "make". Short options can be bundled, i.e.
 -l::
 --long-tests::
 	This causes additional long-running tests to be run (where
-	available), for more exhaustive testing.
+	available), for more exhaustive testing. These tests can use a
+	lot of memory, so only one of them runs at a time, even
+	when several test scripts run in parallel (e.g. "prove --jobs").
+	They take turns through a lock file, "expensive.lock" in the
+	test-results directory. A lock left behind by a killed test
+	script is cleared by the next one that needs it. If the lock
+	cannot be created at all, the test runs anyway.
 
 -r::
 --run=<test-selector>::
diff --git a/t/test-lib.sh b/t/test-lib.sh
index c56654b7c5..bfd2fc8374 100644
--- a/t/test-lib.sh
+++ b/t/test-lib.sh
@@ -778,12 +778,23 @@ test_missing_prereq=
 
 test_external_has_tap=0
 
+# This function takes care of cleaning up the lock we
+# acquire in acquire_expensive_lock_. It is defined
+# up here as we refer to it in die().
+release_expensive_lock_ () {
+	test -n "$have_expensive_lock_" || return 0
+	rm -f "$expensive_lock_"
+	have_expensive_lock_=
+}
+
 die () {
 	code=$?
 	# This is responsible for running the atexit commands even when a
 	# test script run with '--immediate' fails, or when the user hits
 	# ctrl-C, i.e. when 'test_done' is not invoked at all.
 	test_atexit_handler || code=$?
+	release_expensive_lock_
+	test -z "$expensive_lock_" || rm -f "$expensive_lock_.$$"
 	if test -n "$GIT_EXIT_OK"
 	then
 		exit $code
@@ -1089,6 +1100,71 @@ fail_117 () {
 	return 117
 }
 
+# EXPENSIVE tests may need many gigabytes of memory, so two of them
+# running at the same time can exhaust the machine.
+#
+# Allow only one at a time across all test scripts that share
+# this TEST_OUTPUT_DIRECTORY.
+expensive_lock_="$TEST_RESULTS_DIR/expensive.lock"
+have_expensive_lock_=
+
+expensive_lock_unavailable_ () {
+	say >&3 "cannot take the EXPENSIVE lock, running anyway"
+	rm -f "$expensive_lock_.$$"
+}
+
+acquire_expensive_lock_ () {
+	local owner waited= tmp="$expensive_lock_.$$" misses=0
+	mkdir -p "$TEST_RESULTS_DIR" ||
+	{ expensive_lock_unavailable_; return 0; }
+	# The lock is a hard link to a file that already holds our PID, so
+	# it never exists without its owner recorded in it. Remove any
+	# $tmp left by a dead process with our PID first: it may still be
+	# linked to that process's lock, which writing to it would empty.
+	rm -f "$tmp"
+	echo $$ >"$tmp" ||
+	{ expensive_lock_unavailable_; return 0; }
+	while ! ln "$tmp" "$expensive_lock_" 2>/dev/null
+	do
+		if ! test -f "$expensive_lock_"
+		then
+			# Nobody holds the lock, yet we cannot create it (no
+			# hard links, disk full, ...). Retry in case it was
+			# just released, then run anyway rather than wait
+			# forever.
+			misses=$((misses + 1))
+			test $misses -lt 3 && continue
+			expensive_lock_unavailable_
+			return 0
+		fi
+		misses=0
+		owner=$(cat "$expensive_lock_" 2>/dev/null)
+		# A lock carrying our own PID was left by a dead holder whose
+		# PID we were given again; we know we do not hold it.
+		if test -n "$owner" &&
+		   { test "$owner" = $$ || ! kill -0 "$owner" 2>/dev/null; }
+		then
+			# The holder was killed without releasing the lock.
+			#
+			# Another waiter may have taken it over since we
+			# looked, so only remove it if it is still the same.
+			if test "$(cat "$expensive_lock_" 2>/dev/null)" = "$owner"
+			then
+				rm -f "$expensive_lock_"
+			fi
+			continue
+		fi
+		if test -z "$waited"
+		then
+			say >&3 "waiting for another EXPENSIVE test to finish"
+			waited=t
+		fi
+		sleep 1
+	done
+	have_expensive_lock_=t
+	rm -f "$tmp"
+}
+
 test_run_ () {
 	test_cleanup=:
 	expecting_failure=$2
@@ -1103,6 +1179,12 @@ test_run_ () {
 		fi
 	fi
 
+	case ",$test_prereq," in
+	*,EXPENSIVE,*)
+		acquire_expensive_lock_
+		;;
+	esac
+
 	setup_malloc_check
 	test_eval_ "$1"
 	eval_ret=$?
@@ -1115,6 +1197,7 @@ test_run_ () {
 		test_eval_ "$test_cleanup"
 		teardown_malloc_check
 	fi
+	release_expensive_lock_
 	if test "$verbose" = "t" && test -n "$HARNESS_ACTIVE"
 	then
 		echo ""

-- 
2.56.1.911.g883d8bcb20

