Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795858042;
	b=DxpNqQjZJ3QgjQcENtckLlWma0PXzM2GFi+GjoCuUmb6aTJZZeE7rIvNB/5605AeS5R2
	 gdGBrMEIViMr2R+q7KavXXNNf0CWRZxoqT5m1i7xXmfTMzsZjLvuQdvlv7vU3CXUAScxL
	 xNlZZqYWRbkxwvYGX2F+s4opVwhUDhCeoVvut3WDQQ9Gw3Bhq2qowR7zxd+SM3Li3H9bt
	 hRchMDPnE9TsMQzfqJ2zRgmSCuStJkWkj7n2ZcK0inP4KN6w8zAEw6sSdPxo3Toj6POfA
	 iHtoC7a8GLLjtReO33n2NHZKPMkqKFbjjIoBbed2nfuxDm2U77AxhHvPa6bMrNSW+Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795858042;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-Id:In-Reply-To:
	 References:From:Date:Subject:Fcc:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:To:Cc;
	bh=omarn6+YJtTu/XL4e0YXRf67tGqYygzjCGvyqCGlK50=;
	b=CLHi7H1SwGa5CKVt55xaUgoeGs0qQd8jDyq88oRD9bfFivtiolaug3r8OIXlMgOd+XxM
	 sP54KStDsDkGgrIV7/QrA+wlZCYlx7gV87gl0ErTfKqKiptLvevd8/pOgjS7C+qa6TBUb
	 rB2ctAeCE3g4NwU8zegLdM7hGD9ymTKcWTHLU/vS496LaFJnLiVzkJ7c/6Auw8FslUvE0
	 zPg11+IU+RQgeceqh2G5dPIBhYNmON9+qxg5PkzwCYKn9AH0pzxijs7JX2xkv9+HXfYYJ
	 RRYQSYYqW0VurtlWcWP8+3VCb8WSJ62HZ28jQtnJr1oy38sXA+8a/3CL7xvMt1Sn5iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y0+8POPK;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7E3606A31C
	for <git@vger.kernel.org>; Sat, 28 Nov 2026 09:27:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E7E3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y0+8POPK
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-38190551625so16849515eec.1
        for <git@vger.kernel.org>; Sat, 28 Nov 2026 01:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795858041; x=1796462841; darn=vger.kernel.org;
        h=cc:to:mime-version:content-transfer-encoding:content-type:fcc
         :subject:date:from:references:in-reply-to:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=omarn6+YJtTu/XL4e0YXRf67tGqYygzjCGvyqCGlK50=;
        b=Y0+8POPKEjuz6ux2+IOLTOML5d2eV8RZCffr6vChUx9ocUi3Jv5IoXZSjnV5NIweym
         lhlGX8b/3dq53zgTD+rHIUolIMqoNfuGVrYfeMmEA8/7zDL8ovmQL1BYt404qD1Gy+jn
         TkVx68OAsCnwQ1MxgYoys2RQx+J7i94qJajalEDP8L/uGyCPESKTqScKnx+lQjgxfah6
         CutF2S+2XYybdfvy1Q71qIjDBl6jug2io1kkn13CMnLqTIDJQeHJimOVAf+oAWFLDYeZ
         A+WKDLOeStBP/NG42+41amlpa4WT2cfSjw4JIIPyZXwuaN0GA7xn562dwxYTsTiGQ6XE
         f3fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795858041; x=1796462841;
        h=cc:to:mime-version:content-transfer-encoding:content-type:fcc
         :subject:date:from:references:in-reply-to:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=omarn6+YJtTu/XL4e0YXRf67tGqYygzjCGvyqCGlK50=;
        b=aiZXWnYbb5Okf95jNopbUjZfCgYjvlivTIq+wONOf9ocZNKCSWRhvwI/ICdvLOSNvO
         5x5b+VEK99ANxDjCIYpscFAFOnZJhiCU45jle41xxMMYtzOYdn2c/85VyrlwIkF0ktyR
         Wl2zaFhWjHvxfW/JvfRCPIDjpJAFU8AYf5lVT6nF0tTqyCqYDTfU76UhHcJScP23sxA/
         d66LurOpxINMMYgyTLL32DZHP9Pvep+w0GPEnjWx5729NlZK7QWYg+pS3Wx3AJNz7hlJ
         OtGqL3zYYxBPG9ZNc8fuSUr4F6bDibIGdmQJ06aO41qpY2q3vfbbZFO5tBfWuR1nsG9B
         /76g==
X-Gm-Message-State: APuU4Z/6L6fm61cr9K18ZV6XmzCDxHs9BBdV+uhfL7yStSW7smS4J23J
	X6RMH7d/ecKCWwBaWGUj0hoWzd/bTcEs7ei9pvVRLgh1HuQXfNXmwFGSIPnjOw==
X-Gm-Gg: AZFdTZd05WVhKeL4mcSEzciP493Ou49e29bgKoWYLtW/eQBuX6Og/dIrXuEX2exuUrc
	2B5LsUMaoIj4+8ETDDTTn8iQVGGYhkjjwlW5uLUYPulgDRTabFMv5w+dZ88vbVfPNvh+g2XUVBu
	vS/jrd+C24ma/NvIofHrrpJTQHSXqAdEaM2CfzbTBLkhmo6gkaZQuJLNVZUXDmTUXjncx/a5R5J
	bP7BZ1RB6zBND4twKD+7A5du5u6To93LXL2RbjBCqD9br1A4QJXXt6EQUnT+iVop+WOOZBrVyUO
	cpyYr0e+pjs1qa5oIYQMzXy1TFWwMYER65TzSx1RGIGPHOau/yDU7unqREtTTEt+Yx7swogJJ2d
	9vUggoVwz061HSoq1Ywwoi3LOqCkFi/Do4Mm8pGHo4XOGeUitylXpqEnJrXUrnwO3evJVKsbAO6
	QX1L/mCrSViJWvOgP3MsEUFsO+uFcBtc5iMXPQtRLVLgDVXljA4cZja/6Mk8oRBbqle6nZxIgq5
	qzVDzO1jCVYQPriuYj4fVKPHW+B1JbXj862dS9q4pE61VaJUHuwAjNcRUx/iKQuow7GSu2uglpM
	B8QlmEpU2cyFTByWfOYZ9tZC4HlIuTLe
X-Received: by 2002:a05:7300:6da7:b0:384:5885:2f81 with SMTP id 5a478bee46e88-3856c0c7c06mr12606166eec.5.1795858041021;
        Sat, 28 Nov 2026 01:27:21 -0800 (PST)
Received: from [127.0.0.1] ([52.238.26.242])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386c7c62a91sm39982685eec.17.2026.11.28.01.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 01:27:20 -0800 (PST)
Message-Id: <pull.2337.v2.git.1795858039529.gitgitgadget@gmail.com>
In-Reply-To: <pull.2337.git.1795701443098.gitgitgadget@gmail.com>
References: <pull.2337.git.1795701443098.gitgitgadget@gmail.com>
From: "blanet via GitGitGadget" <gitgitgadget@gmail.com>
Date: Sat, 28 Nov 2026 09:27:19 +0000
Subject: [PATCH v2] read-cache: hash the shared index even with index.skipHash
Fcc: Sent
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailing-List: git@vger.kernel.org
List-Id: <git.vger.kernel.org>
List-Post: <mailto:git@vger.kernel.org>
List-Help: <mailto:git+help@vger.kernel.org>
List-Subscribe: <mailto:git+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:git+unsubscribe@vger.kernel.org>
List-Owner: <mailto:git+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
To: git@vger.kernel.org
Cc: Junio C Hamano <gitster@pobox.com>,
    blanet <bupt_xingxin@163.com>,
    Xing Xin <xingxin.xx@bytedance.com>

From: Xing Xin <xingxin.xx@bytedance.com>

The shared index of a split index is named after its trailing hash,
which the split index records in its "link" extension to find it.
Since ee1f0c242e (read-cache: add index.skipHash config option,
2023-01-06), do_write_index() skips that hash for the shared index
too, so with index.skipHash and core.splitIndex both set, the shared
index is written as "sharedindex.<null OID>" and the split index
records a null OID as its base. Reading the index back, a null base
means there is no shared index: the entries that were moved there are
lost, "git ls-files" no longer shows them and "git status" reports
them as deleted and untracked. With fsmonitor, it can hit a BUG() in
fsmonitor.c instead, when the fsmonitor bitmap refers to more entries
than the index has.

Scalar has enabled index.skipHash since 05f28e4b3c (scalar: use
index.skipHash=true for performance, 2025-12-12), and
feature.manyFiles implies it. The tests that ran into this under
GIT_TEST_SPLIT_INDEX unset that variable instead, in 05f28e4b3c, in
7cce609e08 (t9210, t9211: disable GIT_TEST_SPLIT_INDEX for scalar
clone tests, 2026-04-15), and in 6b6d1d56eb (read-cache: verify
skipHash index by stat data, 2026-10-22) and a644ad5f34 (status: lock
the index only to write it, 2026-10-22).

Let the callers of do_write_index() decide whether to skip the hash,
and always compute it for the shared index, so that the two settings
no longer conflict.

This gives up index.skipHash on the file where skipping the hash would
save the most per write, as the shared index holds nearly all the
entries. But what index.skipHash saves is the hashing done on each
write, and the split index is designed to make writing a shared index
rare: once there is one, a new one is written only when more than
splitIndex.maxPercentChange of the entries (20% by default) are not
in it. The frequent writes are of the split index, which holds the
entries added or changed since the shared index was written, as well
as all the extensions, and still skips the hash.

Document this under index.skipHash, add a test, and drop the
workarounds, as those tests now pass with GIT_TEST_SPLIT_INDEX.

Signed-off-by: Xing Xin <xingxin.xx@bytedance.com>
---
    read-cache: hash the shared index even with index.skipHash
    
    Changes since v1:
    
     * Explain in the log message why hashing the shared index despite
       index.skipHash is acceptable, as it is rewritten only rarely, and
       drop the claim that this keeps most of the benefit.
     * Say the same in the index.skipHash documentation.

Published-As: https://github.com/gitgitgadget/git/releases/tag/pr-2337%2Fblanet%2Fxx%2Fsplit-index-skip-hash-v2
Fetch-It-Via: git fetch https://github.com/gitgitgadget/git pr-2337/blanet/xx/split-index-skip-hash-v2
Pull-Request: https://github.com/gitgitgadget/git/pull/2337

Range-diff vs v1:

 1:  0502560699 ! 1:  16091375ca read-cache: hash the shared index even with index.skipHash
     @@ Commit message
          records a null OID as its base. Reading the index back, a null base
          means there is no shared index: the entries that were moved there are
          lost, "git ls-files" no longer shows them and "git status" reports
     -    them as deleted and untracked. With fsmonitor, it hits a BUG() in
     -    fsmonitor.c instead, as the fsmonitor bitmap refers to more entries
     +    them as deleted and untracked. With fsmonitor, it can hit a BUG() in
     +    fsmonitor.c instead, when the fsmonitor bitmap refers to more entries
          than the index has.
      
     -    Scalar sets index.skipHash since 05f28e4b3c (scalar: use
     -    index.skipHash=true for performance, 2025-12-12), and feature.manyFiles
     -    implies it. The tests that ran into this under GIT_TEST_SPLIT_INDEX
     -    unset that variable instead, in 05f28e4b3c, in 7cce609e08 (t9210,
     -    t9211: disable GIT_TEST_SPLIT_INDEX for scalar clone tests,
     -    2026-04-15) and in a644ad5f34 (status: lock the index only to write
     -    it, 2026-10-22).
     +    Scalar has enabled index.skipHash since 05f28e4b3c (scalar: use
     +    index.skipHash=true for performance, 2025-12-12), and
     +    feature.manyFiles implies it. The tests that ran into this under
     +    GIT_TEST_SPLIT_INDEX unset that variable instead, in 05f28e4b3c, in
     +    7cce609e08 (t9210, t9211: disable GIT_TEST_SPLIT_INDEX for scalar
     +    clone tests, 2026-04-15), and in 6b6d1d56eb (read-cache: verify
     +    skipHash index by stat data, 2026-10-22) and a644ad5f34 (status: lock
     +    the index only to write it, 2026-10-22).
      
          Let the callers of do_write_index() decide whether to skip the hash,
     -    and always compute it for the shared index. This keeps most of the
     -    benefit: the shared index is rewritten only now and then (see
     -    splitIndex.maxPercentChange), while the split index, written on every
     -    index update, still skips it.
     +    and always compute it for the shared index, so that the two settings
     +    no longer conflict.
      
     -    Add a test, and drop the workarounds, as those tests now pass with
     -    GIT_TEST_SPLIT_INDEX.
     +    This gives up index.skipHash on the file where skipping the hash would
     +    save the most per write, as the shared index holds nearly all the
     +    entries. But what index.skipHash saves is the hashing done on each
     +    write, and the split index is designed to make writing a shared index
     +    rare: once there is one, a new one is written only when more than
     +    splitIndex.maxPercentChange of the entries (20% by default) are not
     +    in it. The frequent writes are of the split index, which holds the
     +    entries added or changed since the shared index was written, as well
     +    as all the extensions, and still skips the hash.
     +
     +    Document this under index.skipHash, add a test, and drop the
     +    workarounds, as those tests now pass with GIT_TEST_SPLIT_INDEX.
      
          Signed-off-by: Xing Xin <xingxin.xx@bytedance.com>
      
       ## Documentation/config/index.adoc ##
      @@ Documentation/config/index.adoc: index.skipHash::
     - 	This accelerates Git commands that manipulate the index, such as
     - 	`git add`, `git commit`, or `git status`. Instead of storing the
       	checksum, write a trailing set of bytes with value zero, indicating
     --	that the computation was skipped.
     -+	that the computation was skipped. The shared index of a split index
     -+	(see `core.splitIndex`) is still hashed, as it is named after its
     -+	hash.
     + 	that the computation was skipped.
       +
     ++With a split index (see `core.splitIndex`), only the split index, which
     ++is written on every index update, skips the hash. The shared index is
     ++still hashed, as it is named after its hash, but it is rewritten only
     ++when too many entries are not in it (see `splitIndex.maxPercentChange`).
     +++
       If you enable `index.skipHash`, then Git clients older than 2.13.0 will
       refuse to parse the index and Git clients older than 2.40.0 will report an
     + error during `git fsck`.
      
       ## read-cache.c ##
      @@ read-cache.c: enum write_extensions {


 Documentation/config/index.adoc |  5 +++++
 read-cache.c                    | 18 ++++++++++++------
 t/t1700-split-index.sh          | 23 +++++++++++++++++++++++
 t/t7508-status.sh               | 10 ----------
 t/t9210-scalar.sh               | 10 ----------
 t/t9211-scalar-clone.sh         |  5 -----
 6 files changed, 40 insertions(+), 31 deletions(-)

diff --git a/Documentation/config/index.adoc b/Documentation/config/index.adoc
index a23be914e3..08620846b5 100644
--- a/Documentation/config/index.adoc
+++ b/Documentation/config/index.adoc
@@ -43,6 +43,11 @@ index.skipHash::
 	checksum, write a trailing set of bytes with value zero, indicating
 	that the computation was skipped.
 +
+With a split index (see `core.splitIndex`), only the split index, which
+is written on every index update, skips the hash. The shared index is
+still hashed, as it is named after its hash, but it is rewritten only
+when too many entries are not in it (see `splitIndex.maxPercentChange`).
++
 If you enable `index.skipHash`, then Git clients older than 2.13.0 will
 refuse to parse the index and Git clients older than 2.40.0 will report an
 error during `git fsck`.
diff --git a/read-cache.c b/read-cache.c
index 595497d14c..a734943c97 100644
--- a/read-cache.c
+++ b/read-cache.c
@@ -2878,7 +2878,8 @@ enum write_extensions {
  * rely on it.
  */
 static int do_write_index(struct index_state *istate, struct tempfile *tempfile,
-			  enum write_extensions write_extensions, unsigned flags)
+			  enum write_extensions write_extensions, unsigned flags,
+			  int skip_hash)
 {
 	uint64_t start = getnanotime();
 	struct hashfile *f;
@@ -2900,9 +2901,7 @@ static int do_write_index(struct index_state *istate, struct tempfile *tempfile,
 	int nr, nr_threads, ret;
 
 	f = hashfd(the_repository->hash_algo, tempfile->fd, tempfile->filename.buf);
-
-	prepare_repo_settings(r);
-	f->skip_hash = r->settings.index_skip_hash;
+	f->skip_hash = skip_hash;
 
 	for (i = removed = extended = 0; i < entries; i++) {
 		if (cache[i]->ce_flags & CE_REMOVE)
@@ -3224,9 +3223,11 @@ static int do_write_locked_index(struct index_state *istate,
 		return ret;
 	}
 
+	prepare_repo_settings(istate->repo);
 	trace2_region_enter_printf("index", "do_write_index", istate->repo,
 				   "%s", get_lock_file_path(lock));
-	ret = do_write_index(istate, lock->tempfile, write_extensions, flags);
+	ret = do_write_index(istate, lock->tempfile, write_extensions, flags,
+			     istate->repo->settings.index_skip_hash);
 	trace2_region_leave_printf("index", "do_write_index", istate->repo,
 				   "%s", get_lock_file_path(lock));
 
@@ -3339,9 +3340,14 @@ static int write_shared_index(struct index_state *istate,
 	move_cache_to_base_index(istate);
 	convert_to_sparse(istate, 0);
 
+	/*
+	 * The shared index is named after its trailing hash, which the
+	 * split index records to find it: compute it even with
+	 * index.skipHash.
+	 */
 	trace2_region_enter_printf("index", "shared/do_write_index",
 				   the_repository, "%s", get_tempfile_path(*temp));
-	ret = do_write_index(si->base, *temp, WRITE_NO_EXTENSION, flags);
+	ret = do_write_index(si->base, *temp, WRITE_NO_EXTENSION, flags, 0);
 	trace2_region_leave_printf("index", "shared/do_write_index",
 				   the_repository, "%s", get_tempfile_path(*temp));
 
diff --git a/t/t1700-split-index.sh b/t/t1700-split-index.sh
index 887e72a5fa..86eae9eb1d 100755
--- a/t/t1700-split-index.sh
+++ b/t/t1700-split-index.sh
@@ -544,4 +544,27 @@ test_expect_success 'GIT_TEST_SPLIT_INDEX works' '
 	)
 '
 
+test_expect_success 'shared index is hashed even with index.skipHash' '
+	git init skip-hash &&
+	(
+		cd skip-hash &&
+		git config core.splitIndex true &&
+		git config index.skipHash true &&
+		test_commit one &&
+		test_commit two &&
+
+		test-tool dump-split-index .git/index >dump &&
+		echo "own $ZERO_OID" >expect &&
+		grep "^own " dump >actual &&
+		test_cmp expect actual &&
+		base=$(sed -n "s/^base //p" dump) &&
+		test "$base" != "$ZERO_OID" &&
+		test_path_is_file .git/sharedindex.$base &&
+
+		git ls-files >actual &&
+		test_write_lines one.t two.t >expect &&
+		test_cmp expect actual
+	)
+'
+
 test_done
diff --git a/t/t7508-status.sh b/t/t7508-status.sh
index e10c961268..dde5dd1020 100755
--- a/t/t7508-status.sh
+++ b/t/t7508-status.sh
@@ -1691,11 +1691,6 @@ do
 		git init update-after-read &&
 		(
 			cd update-after-read &&
-			if test $skip_hash = true
-			then
-				# index.skipHash does not work with a split index.
-				sane_unset GIT_TEST_SPLIT_INDEX
-			fi &&
 			git config index.skipHash $skip_hash &&
 			test_commit base &&
 			write_script .git/fsmonitor-hook <<-\EOF &&
@@ -1769,11 +1764,6 @@ do
 	test_expect_success "status refresh does not overwrite an index update made while collecting (index.skipHash=$skip_hash)" '
 		test_when_finished "rm -rf refresh-while-collecting" &&
 		(
-			if test $skip_hash = true
-			then
-				# index.skipHash does not work with a split index.
-				sane_unset GIT_TEST_SPLIT_INDEX
-			fi &&
 			setup_index_update_during_collection refresh-while-collecting &&
 			cd refresh-while-collecting &&
 			git config index.skipHash $skip_hash &&
diff --git a/t/t9210-scalar.sh b/t/t9210-scalar.sh
index 137765d3b8..32ad85c577 100755
--- a/t/t9210-scalar.sh
+++ b/t/t9210-scalar.sh
@@ -152,10 +152,6 @@ test_expect_success 'set up repository to clone' '
 '
 
 test_expect_success 'scalar clone' '
-	# index.skipHash (Scalar default) and GIT_TEST_SPLIT_INDEX are
-	# incompatible: the shared index gets a null OID and fails to
-	# load on re-read.
-	sane_unset GIT_TEST_SPLIT_INDEX &&
 	second=$(git rev-parse --verify second:second.t) &&
 	scalar clone "file://$(pwd)" cloned --single-branch &&
 	(
@@ -186,7 +182,6 @@ test_expect_success 'scalar clone' '
 '
 
 test_expect_success 'scalar clone --no-... opts' '
-	sane_unset GIT_TEST_SPLIT_INDEX &&
 	# Note: redirect stderr always to avoid having a verbose test
 	# run result in a difference in the --[no-]progress option.
 	GIT_TRACE2_EVENT="$(pwd)/no-opt-trace" scalar clone \
@@ -251,10 +246,6 @@ test_expect_success 'scalar reconfigure --all with includeIf.onbranch' '
 '
 
 test_expect_success 'scalar reconfigure --all with detached HEADs' '
-	# This test demonstrates an issue with index.skipHash=true and
-	# this test variable for the split index. Disable the test variable.
-	sane_unset GIT_TEST_SPLIT_INDEX &&
-
 	repos="two three four" &&
 	for num in $repos
 	do
@@ -317,7 +308,6 @@ test_expect_success '`scalar [...] <dir>` errors out when dir is missing' '
 
 SQ="'"
 test_expect_success UNZIP 'scalar diagnose' '
-	sane_unset GIT_TEST_SPLIT_INDEX &&
 	scalar clone "file://$(pwd)" cloned --single-branch &&
 	git repack &&
 	echo "$(pwd)/.git/objects/" >>cloned/src/.git/objects/info/alternates &&
diff --git a/t/t9211-scalar-clone.sh b/t/t9211-scalar-clone.sh
index 002d6ecdc1..110985f58d 100755
--- a/t/t9211-scalar-clone.sh
+++ b/t/t9211-scalar-clone.sh
@@ -8,11 +8,6 @@ test_description='test the `scalar clone` subcommand'
 GIT_TEST_MAINT_SCHEDULER="crontab:test-tool crontab cron.txt,launchctl:true,schtasks:true"
 export GIT_TEST_MAINT_SCHEDULER
 
-# index.skipHash (Scalar default) and GIT_TEST_SPLIT_INDEX are
-# incompatible: the shared index gets a null OID and fails to
-# load on re-read.  Every test here uses scalar clone.
-sane_unset GIT_TEST_SPLIT_INDEX
-
 test_expect_success 'set up repository to clone' '
 	rm -rf .git &&
 	git init to-clone &&

base-commit: acba8bf9753134d9bde89f94369f775838a8c5fe
-- 
gitgitgadget
