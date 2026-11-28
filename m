Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795877896;
	b=Mfuv0ld9cdCPnRr0ob+MzCO6JZ0YfyPHIVCUocnVNAtSQbsZ9z5ZEzI09a6NqmpulQds
	 jE00livDBewwWE5XR0bUio1mmOD68OMjIb4AvvvKqo1oCi5KLjsS/dQArrj4YpHQHNW7V
	 dptQnI3dqUpRHplrKkpfCiQexh+EnerSiMijS+c4M4xvEtk5YFje6KT9ghT5iwtMkgcoI
	 LoQWKBeGKln1IPbnDD4PB+M5How/iMYIn72HCu3eWtE98HmPQcY8ODAlua5w/R9qwG6rv
	 OhEm/o9qbkjajuUbJcDKWokWtd8jCDRejyfFV+2fk0Lwx7H7B1hgXOuxm0US8DmkhNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795877896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:In-Reply-To:References:To:Cc:X-Mailer;
	bh=MkTBsrBEKW7LF+LN6dLmrPT9Qk1BuGZbq4S1e8z0oP0=;
	b=3C1zHhNE64L+CFLMP1KAUU1zOvHpzLNXeZE18YAzVAYMmUhwO1cwkO/YWoPvCbT6oGLX
	 ARJLfUVfhE8EsD07XuDjahg81lzo5nn/6AjaTDgpEx6wJCZwitVusIURbYgVTHtZC6VS5
	 YEpuMXbWeLRV1DmwPp3Ygl67csesuMeD+CQiSBcXyAkQ53R/Bpp++YdgFWQRrWGWdTId3
	 H0p+3icU5TsqFXilY5myOhB6fIZmB8pBlNGHS+TSA7Ux2bPxixOX9yKBRi7JEK2jz7rhG
	 GE3/xcQbdA3FX4RqtggDtYWetS93cE/c7h4Npm54Kfwt5Ut4fH8rUssDuoeyVQ/bdbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EOe1NMaQ;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1EE606A31F
	for <git@vger.kernel.org>; Sat, 28 Nov 2026 14:58:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA1EE606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EOe1NMaQ
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1a2761c69fbso13764624c88.0
        for <git@vger.kernel.org>; Sat, 28 Nov 2026 06:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795877895; x=1796482695; darn=vger.kernel.org;
        h=cc:to:references:in-reply-to:content-transfer-encoding:content-type
         :mime-version:message-id:date:subject:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MkTBsrBEKW7LF+LN6dLmrPT9Qk1BuGZbq4S1e8z0oP0=;
        b=EOe1NMaQKU/weiuwigmZ75+4xE3VXoCTtTjujuGjAwOmEgndtSLx0/THoZxtR4espV
         kiKUYxKX4wMbxi1Bn28kJAV41EKNOyZQ5PosaXEYryK76LEB7aoh4DGvCGhjQkqB+Omf
         VAws7d35swqAi/IT/V+qyBMY3YSueIT2CJRw1wJrjbpKdGqHaDMGQJEqVhxxQWZaaa6D
         w7VyL8ocZmWZ9PVPuEVGvOHBYX7j3X6z2jhl1axpiqzWBWMcJDVEQobYWnE/DxLVLPGw
         OFqTJY44vH997qeBm8XVv98E8bHtqBJUZH38WIzxpgn9bM2PpTpeJ78X6eK3W+/BKKh4
         dnnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795877895; x=1796482695;
        h=cc:to:references:in-reply-to:content-transfer-encoding:content-type
         :mime-version:message-id:date:subject:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MkTBsrBEKW7LF+LN6dLmrPT9Qk1BuGZbq4S1e8z0oP0=;
        b=gHoCPbAASRKsSjMP6PPDMGO9hZoYzje1Wvk0iqQCRCxB5F1ln252wY7S0iPJlbR/oM
         +HeTNLAWvYkQL77qiEXepmiDwHcnOX2sIaPpLoGPnHIF7BzTPkzyj2LJCoxpAcdIUNA3
         6Ykr1isj2LhW1084Md56d0XjAiSUWB2Fgt/pw31trQqmB0bUv6UVRD0fXb2C+7+EbGyv
         Ae0BjkUKsoVnBOu6+u0Vmsa/Bgh+gTw9lRYLIc9GPmhJJ+9GwUUqTYWioGpX5ORhmh0x
         etrSijAGaM/R0h9jkdhmmkeWez7UQu2NjCEK7v7efh8UE3EZ28sDFDOd23Y7yIZbEQnH
         Bmsw==
X-Gm-Message-State: APuU4Z+QYekUXIaYfZhF0TDGn1JHTPMCeCND9quq9iylXec5UllAmKO/
	KOJOq+IKtMQE0MDCxx4SWIkLSeHfLlcMzpIykghaYDgrMoSABEO/tCH0
X-Gm-Gg: AZFdTZfNKdEzgoQgbpmcmQc5rtcxV6uPeOXhRh+i79KAcixnEIuoXvJZXb2B0gNgO+9
	+gtUxs/s7+2Zr2tIBTMWyWzxMyNrWfLuhpp+lK/v4KHk0vr5Gsq2LkihwQ/Zb3q6nu0FYeMydZ9
	ryykeNXphJ32D2Xkl7E38GodsVmdepIjt5mGROqAwxa4TehesBSN5rfBLnyKlUJmCemyHl8hecY
	momfgj1vINhtb85BTLxS9wtMMCHIa/Dp925mvhGbBFJlI2PWes00Z6txGXp6rsd5DQRfieV/lWm
	xQzq796evSi/iLz6M7beaIwmwnduNf3W1tSpHJ0Pnjrued8Qffvb/n35YRofrmfZfoQQ0jIm/Gs
	jbv17yMr9GYnRZTZHgADlVSFz6Qj/N8nFvBYUCkVd0pX340iG4yo3gQyhlsMMl+wgJ47pXNTDRm
	vGirGZbkBVSDM7Ww9EMFnJer8Yf9acJwSKBAzr14GQ9w7srt87Fc+CdMOpPqWTMJvdAXBSHKE9D
	t0AELTCCF78LADeM2J718HQHzeVhf8V/zibhAxU71XUBf6utyo2OV19LLeX7L0wBE1KyUro1w27
	11utWLjGGbAVIr2oqjs1Gmi8sDFYmUV8Kykqlg==
X-Received: by 2002:a05:701b:4308:b0:15a:9834:73f2 with SMTP id a92af1059eb24-1b55692031cmr27680170c88.38.1795877894898;
        Sat, 28 Nov 2026 06:58:14 -0800 (PST)
Received: from [127.0.1.1] ([2406:7400:12b:ed80:cd5:5f99:c548:8028])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm58322930c88.4.2026.11.28.06.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 06:58:14 -0800 (PST)
From: Kaartic Sivaraam <kaartic.sivaraam@gmail.com>
Subject: [PATCH v4 0/2] test-lib: serialize EXPENSIVE tests to avoid OOM in
 CI
Date: Sat, 28 Nov 2026 20:27:58 +0530
Message-Id: <20261128-ks-ci-long-test-hang-fix-v4-0-f117badd2e13@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAPfrCmsC/43PywrCMBAF0F+RrB3JTGsfrvwPcRGnSY2PVpoal
 NJ/N6kIIigub7hzLhmE053VTqxmg+i0t862TQjpfCZ4r5pag61CFiQpQ8Qcjg7Ywqltaui16yG
 WwNgbSFnonEyVSs5EOL90OjxP9Gb7zO66O2juoxcbe+v6trtP2x5j7zVTfp/xCAjpkskYk1Wlk
 ev6rOxpwe1ZxBlP/0IUoCSXiCyLpJDVJ5S8QfTj4z4JUIk7UooLUsjv0DiODzs/r0VkAQAA
X-Change-ID: 20261117-ks-ci-long-test-hang-fix-008e72fd40c6
In-Reply-To: <20261119-ks-ci-long-test-hang-fix-v1-1-45c2fff6d9f0@gmail.com>
References: <20261119-ks-ci-long-test-hang-fix-v1-1-45c2fff6d9f0@gmail.com>
To: Git mailing list <git@vger.kernel.org>
Cc: Harald Nordgren <haraldnordgren@gmail.com>, 
 Junio C Hamano <gitster@pobox.com>, Patrick Steinhardt <ps@pks.im>
X-Mailer: b4 0.16.0

In recent times, we've been noticing the sanitizer jobs (linux-leaks,
linux-reftable-leaks, linux-asan-ubsan) hang and fail with timeout in
our GitLab CI runners. On some digging, it turns out that this is
because of multiple memory hungry tests running in parallel.

So, I thought of suggesting this patch to serialize the expensive tests
at least to avoid the putting the CI runners under memory pressure.

The GitHub CI runners also observed the same behaviour.

Both CI runners are happy with this change.

GitHub: https://github.com/sivaraam/git/actions/runs/46125210187/job/140918221115
GitLab: https://gitlab.com/gitlab-org/git/-/pipelines/3126154287

Signed-off-by: Kaartic Sivaraam <kaartic.sivaraam@gmail.com>
---
Changes in v4:
- Made a few more commit messages tweaks pointed out by Junio.
- Moved release_expensive_lock_ above die() to ensure it is always
  defined before die() is invoked.
- All ways of failing to take the lock now print the same message,
  clean up, and run the test anyway.
- 2/2 is new. It adds a few subtests to ensure the lock cleanup
  happens appropriately.
- Link to v3: https://patch.msgid.link/20261127-ks-ci-long-test-hang-fix-v3-1-91b2aac82a1c@gmail.com

Changes in v3:
- Fixed issues in the commit message as pointed out by Junio.
- Fixed a race, pointed out in review, where a waiter could remove a
  lock another script had just taken, letting two EXPENSIVE tests run
  at once. A waiter now re-reads the owner and only removes the lock
  if it still names the same dead process.
- Fixed a deadlock where a script killed between creating the lock and
  recording its PID left a lock that nobody would ever remove. The lock
  is now a hard link to a file that already holds the PID, so it never
  exists without an owner.
- A lock that names the waiter's own PID (left by a dead holder whose
  PID was reused) is now treated as stale instead of waited on forever.
- If the lock cannot be created although nobody holds it (no hard
  links, read-only or full disk), the test runs without it instead of
  waiting forever.
- Rewrote the lock part of the commit message for the new scheme.
- Link to v2: https://patch.msgid.link/20261119-ks-ci-long-test-hang-fix-v2-1-37011c08380d@gmail.com

Changes in v2:
- Corrected commit messages as per Patrick's suggestions
- Tweaked the shell function comment to avoid mentioning 'prove --jobs'
- Made the owner and waiting variables local within acquire_expensive_lock_
- Link to v1: https://patch.msgid.link/20261119-ks-ci-long-test-hang-fix-v1-1-45c2fff6d9f0@gmail.com

---
Kaartic Sivaraam (2):
      test-lib: run EXPENSIVE tests one at a time
      t0000: test taking over and releasing the EXPENSIVE lock

 t/README         |  8 +++++-
 t/t0000-basic.sh | 48 ++++++++++++++++++++++++++++++++
 t/test-lib.sh    | 83 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 138 insertions(+), 1 deletion(-)

Range-diff versus v3:

1:  0d7635ef9f ! 1:  71b765784d test-lib: run EXPENSIVE tests one at a time
    @@ Commit message
     
         Recently, we've acquired quite a few expensive tests in our test suite.
         For instance, these commits add several tests that require
    -    multi-gigabytes of memory:
    +    multiple gigabytes of memory:
     
           - 89048b48fb (t1600-index: add expensive tests for over-long
             tree paths, 2026-10-16) added tests to t1600
    @@ Commit message
         alongside it. Running the two under a 16GB memory cap reproduces it,
         with the t1007 git process getting OOM-killed.
     
    -    GitHub CI runners are no exception and observe the same behaviour.
    +    GitHub CI runners are no exception and experience the same behaviour.
     
         Take a lock shared by all test scripts around each EXPENSIVE test, so
         only one of them runs at a time. Cheap tests in the same scripts keep
    @@ Commit message
         and a waiter removes it after re-reading it, so that a lock another
         waiter has just taken is left alone. Two waiters clearing the same
         stale lock at once may let two expensive tests run together, which is
    -    rare and better than hanging. If the lock cannot be created although
    -    nobody holds it, e.g. without hard link support, the test runs anyway.
    +    rare and better than hanging. If the lock cannot be taken although
    +    nobody holds it, e.g. without hard link support or on a read-only or
    +    full disk, the test runs anyway.
     
         Signed-off-by: Kaartic Sivaraam <kaartic.sivaraam@gmail.com>
     
    @@ t/README: appropriately before running "make". Short options can be bundled, i.e
      --run=<test-selector>::
     
      ## t/test-lib.sh ##
    -@@ t/test-lib.sh: die () {
    +@@ t/test-lib.sh: test_missing_prereq=
    + 
    + test_external_has_tap=0
    + 
    ++# This function takes care of cleaning up the lock we
    ++# acquire in acquire_expensive_lock_. It is defined
    ++# up here as we refer to it in die().
    ++release_expensive_lock_ () {
    ++	test -n "$have_expensive_lock_" || return 0
    ++	rm -f "$expensive_lock_"
    ++	have_expensive_lock_=
    ++}
    ++
    + die () {
    + 	code=$?
    + 	# This is responsible for running the atexit commands even when a
      	# test script run with '--immediate' fails, or when the user hits
      	# ctrl-C, i.e. when 'test_done' is not invoked at all.
      	test_atexit_handler || code=$?
    @@ t/test-lib.sh: fail_117 () {
     +expensive_lock_="$TEST_RESULTS_DIR/expensive.lock"
     +have_expensive_lock_=
     +
    ++expensive_lock_unavailable_ () {
    ++	say >&3 "cannot take the EXPENSIVE lock, running anyway"
    ++	rm -f "$expensive_lock_.$$"
    ++}
    ++
     +acquire_expensive_lock_ () {
     +	local owner waited= tmp="$expensive_lock_.$$" misses=0
    -+	mkdir -p "$TEST_RESULTS_DIR" || return 1
    ++	mkdir -p "$TEST_RESULTS_DIR" ||
    ++	{ expensive_lock_unavailable_; return 0; }
     +	# The lock is a hard link to a file that already holds our PID, so
     +	# it never exists without its owner recorded in it. Remove any
     +	# $tmp left by a dead process with our PID first: it may still be
     +	# linked to that process's lock, which writing to it would empty.
     +	rm -f "$tmp"
    -+	echo $$ >"$tmp" || return 1
    ++	echo $$ >"$tmp" ||
    ++	{ expensive_lock_unavailable_; return 0; }
     +	while ! ln "$tmp" "$expensive_lock_" 2>/dev/null
     +	do
     +		if ! test -f "$expensive_lock_"
    @@ t/test-lib.sh: fail_117 () {
     +			# forever.
     +			misses=$((misses + 1))
     +			test $misses -lt 3 && continue
    -+			say >&3 "cannot take the EXPENSIVE lock, running anyway"
    -+			rm -f "$tmp"
    ++			expensive_lock_unavailable_
     +			return 0
     +		fi
     +		misses=0
    @@ t/test-lib.sh: fail_117 () {
     +	have_expensive_lock_=t
     +	rm -f "$tmp"
     +}
    -+
    -+release_expensive_lock_ () {
    -+	test -n "$have_expensive_lock_" || return 0
    -+	rm -f "$expensive_lock_"
    -+	have_expensive_lock_=
    -+}
     +
      test_run_ () {
      	test_cleanup=:
-:  ---------- > 2:  6ca7f04310 t0000: test taking over and releasing the EXPENSIVE lock

---
base-commit: acba8bf9753134d9bde89f94369f775838a8c5fe
change-id: 20261117-ks-ci-long-test-hang-fix-008e72fd40c6

