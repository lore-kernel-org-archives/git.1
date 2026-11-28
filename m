Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795853220;
	b=d3nZgrumCr8GPVo17/wouqmug3xWuN66pO3t79+w/mm+5agaksNel/5Kb6UPJ/jGdaRE
	 pjpm0xKYxqQRcbC6zN3nIC6uHA3zdaoQQIXn/nqpdhMl1+uElHJNlyLL7gUz3eVqnra2v
	 0aR7l83TrzKAL7VMMuruEzC+EyblCMj/wpE6IDwEPQyWeRPmPMpGjkOmECy8hoCDrtSsx
	 yHzxmqDo/5pzHLG0GezTxPv1IvIfuGk1aLuq0ouAOkztQusnV0J3fYtxwL6BaXkbBmW3D
	 JKXaII5xtQSTjcBEDOEHqDndmpnd4s3QPmf/FpztvhXFpwR4OGTufvDe2k1A8Oh3SCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795853220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=O0Dg0/RTxO7uA3scJ93EtYyWBhG/t5TUCKlvFrwNbmU=;
	b=uoLmwVRF/bnniVprFjU1JzIEpms2cN+ojD2P3PfTBnjfUKptvrHKmV9hutS7/UlVqjjx
	 g8bmykd56qpp4Z9qZ/7kgTl+DbvxvEl878p27TDUMpGUS5hdgRdiYfrkuvEfcLEpwInVF
	 FQI2WJJuusCrdawvxTDRZZd+ZouGJhTJQfbybCvlVWFSrTRLEEvyHS5QOpiNWeUc+QI+b
	 QMZ0SBNJ33/zUdtHRVoVJTKgqsNAfO4FWIdzksEI2BQeE8js6gXVkhVVaLwOK6wjEyeDv
	 8CESHe6J+8B8fELSW0yBSNF1UXdbyFNqE6bzqn4TAPVmhVO5nUvkiELgjXy5cgyqqRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bYcpBm7k;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB989606A31C
	for <git@vger.kernel.org>; Sat, 28 Nov 2026 08:06:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB989606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bYcpBm7k
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33fb4680717so6454590eec.1
        for <git@vger.kernel.org>; Sat, 28 Nov 2026 00:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795853219; x=1796458019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O0Dg0/RTxO7uA3scJ93EtYyWBhG/t5TUCKlvFrwNbmU=;
        b=bYcpBm7kWKDGr0hgOLC9cqjQqNj7Xv/tL8XWhzF8jcbseSlcg4Jh3JBlaXJMliEDUL
         4cbtRbwVEFO4wuTeyd7v2bzkSBmAwCERnEjLVpMLFxI+WNHwdZ1JOBoIBJKVOZt3Dv+w
         Sfv36daQARkgAICNAAN7TGG8EQHYS8wfqZ3KsTjksB6I9wn46WtBS1HmPq/TYyxamiLd
         5SITOJRPfbBITO3ywjL2bclrtme6z5zarso+lJRTjLHeK/pPbbx8zCV07/+CZvJJZDnn
         wN5qxJkDR4zo0wmorP3bQMYjuXckjnkWowUnja6K1u+A3pbtmPLebzKX1LnEnR2xQcZZ
         mejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795853219; x=1796458019;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O0Dg0/RTxO7uA3scJ93EtYyWBhG/t5TUCKlvFrwNbmU=;
        b=H/oBrClLbHMydmXUCrjqLo+qTPnl/9V4YwYkLXDlfV8DThB10OZazxSmxdf4Ri4UnM
         VDaQNMKQSSQe8bpQD7Joib4MMuW5iNgWt78yU0+6XSq4y6W8Zu5qvN3Of8t4rxr0ticj
         XpM/hRKg2R3d+1vZRuqQhZCygh/K23Zg37nCQK+RcjN+4bdDTwVWPh7E5aWhaYpfGtQa
         opkh/5h8NO8DEcRyLFtFuQc3e1CPFQLgt1mQNzvWoEiH9cwsEzfko+scKF5hFwF9YqXI
         EavWq23j3DJxwX9VlbCgWNe4f2JbOvEjmnW5GKBQpbOMbHqWujpwyinhYqodbpuRAT5B
         oO4A==
X-Gm-Message-State: APuU4Z9WX0OAeeCwQ6t8DZKvexMZRW4sH6FG3L9nCdzzE9WTz2bsOkeh
	5/GcRqHyo3J9yZV0y0pYY/QKBhdcIbIgyuOykf4U26qP6hBBjlDS7yu7
X-Gm-Gg: AZFdTZeufZ5DR8PUrUsRwrUf2XqCpP3XAKqCR5eQaAt/zF43CfPU0XPrA7rOiTMT+A2
	qyFVjBmo6audZ3GywqlnVU6RZkOGVb6xGaEo9gVk4OP9xV0SAhn3HOJw1YYYYkTIzPH6lPXjObC
	e/wAaAQ7Uydw52pAxiKZ3fxk506n1LHzCjClpsQcQ/ycFgSbVH2ws7lsl0QVlVxgxw6tOqvF4hd
	iORM45LhUJjhdkhiOABs3TTM9b+hzP11DsBOdIS6njwLkGjtqsW/PN36nLsYNsGM9zxegRo3rnA
	eXgK7F42FwKmAL9nX4iAtcsQPXpUkmJWQhbyQ2pP/lL1HUuE67sV427JWQkYHhc6vqpm4whiTOM
	2wzQQxoQXed26sIgZ1qYpgxdZqh2yBv9i00XW4A/8N1qo1aSfo7Bt0EBsKMAz55l1eVpF+4czqR
	aui/Mti743gFI0bE/2Qw+Wm7qIMkQUn29YVfQlS8kgEPz3NvvTa2xnO5Ocq0H3Dbprn6CV5by/C
	Q6uYITrMf73gAVxuqlr62QPdijnV9BDYBGjj8TivZWaka5WFLStwfX/0zCoq9A2yot0K6UW3Geh
	SdqOKa9A9so9Hka2pXiTIA6CNj3j5A3Zvk8BtCOCtQVApy87z0/3ZMsxtrSx6q/q2xf2+Iq3jM/
	gdt1TK1Nz
X-Received: by 2002:a05:693c:65c3:b0:386:e9bb:d9d3 with SMTP id 5a478bee46e88-386e9bbda7dmr5277984eec.28.1795853218835;
        Sat, 28 Nov 2026 00:06:58 -0800 (PST)
Received: from ?IPV6:2406:7400:12b:ed80:211c:a254:fe90:c295? ([2406:7400:12b:ed80:211c:a254:fe90:c295])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm90008610eec.26.2026.11.28.00.06.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Nov 2026 00:06:58 -0800 (PST)
Message-ID: <46b303b9-cf58-4c4b-9d2d-07f4c1ce0dc0@gmail.com>
Date: Sat, 28 Nov 2026 13:36:54 +0530
X-Mailing-List: git@vger.kernel.org
List-Id: <git.vger.kernel.org>
List-Post: <mailto:git@vger.kernel.org>
List-Help: <mailto:git+help@vger.kernel.org>
List-Subscribe: <mailto:git+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:git+unsubscribe@vger.kernel.org>
List-Owner: <mailto:git+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] test-lib: run EXPENSIVE tests one at a time
To: Junio C Hamano <gitster@pobox.com>
Cc: Git mailing list <git@vger.kernel.org>,
 Harald Nordgren <haraldnordgren@gmail.com>
References: <20261119-ks-ci-long-test-hang-fix-v1-1-45c2fff6d9f0@gmail.com>
 <20261127-ks-ci-long-test-hang-fix-v3-1-91b2aac82a1c@gmail.com>
 <xmqqpkvq6lzy.fsf@gitster.g>
Content-Language: en-US
From: Kaartic Sivaraam <kaartic.sivaraam@gmail.com>
In-Reply-To: <xmqqpkvq6lzy.fsf@gitster.g>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/28/26 02:16, Junio C Hamano wrote:
> Kaartic Sivaraam <kaartic.sivaraam@gmail.com> writes:
> 
>> Recently, we've acquired quite a few expensive tests in our test suite.
>> For instance, these commits add several tests that require
>> multi-gigabytes of memory:
> 
> Either "multi-gigabyte" or "multiple gigabytes"?
>

Good catch. Will fix it.

>> GitHub CI runners are no exception and observe the same behaviour.
> 
> Pedantic.  You "observe" that runners "experience/suffer from/trigger".
> They do not observe themselves ;-).
> 

Ah. Thanks for correcting my grammar. Will fix this too :-)

> Minor ordering observation.  Because "trap die EXIT" is registered right
> after die(), well before fail_117() where release_expensive_lock_() is
> defined, an early failure while sourcing test-lib-functions.sh under set
> -e would enter die() while release_expensive_lock_() is still undefined.
> 
> I notice that "$expensive_lock_" already has a test -z guard here, and
> that would help avoid such issues to some degree.  Defining the lock
> variables and helpers above die() (or guarding the call) would close
> that small window.
>

That's an interesting one. I've defined it above die() per your suggestion.

>> +acquire_expensive_lock_ () {
>> +	local owner waited= tmp="$expensive_lock_.$$" misses=0
>> +	mkdir -p "$TEST_RESULTS_DIR" || return 1
>> +	# The lock is a hard link to a file that already holds our PID, so
>> +	# it never exists without its owner recorded in it. Remove any
>> +	# $tmp left by a dead process with our PID first: it may still be
>> +	# linked to that process's lock, which writing to it would empty.
>> +	rm -f "$tmp"
>> +	echo $$ >"$tmp" || return 1
> 
> This pre-cleanup and hard-link scheme is neat.  Removing any leftover
> "$tmp" before writing "$$" keeps us from truncating the inode of a stale
> lock still hard-linked to an old "$tmp" from a recycled PID, and
> hard-linking after writing "$$" guarantees $expensive_lock_ never exists
> empty.
> 
> One minor consistency note.  When ln(1) fails three times with no lock
> present, acquire_expensive_lock_() prints "cannot take the EXPENSIVE
> lock, running anyway" to FD 3, removes "$tmp", and returns 0.
> 
> If mkdir or redirecting to "$tmp" fails instead (say, a read-only
> TEST_RESULTS_DIR or a full disk), it returns 1 silently and leaves an
> empty "$tmp" behind on write failure until die() runs.  Because
> test_run_() ignores the return value, the test still runs anyway as
> documented, though sharing the same cleanup, message, and return 0 would
> keep all fallback paths consistent.
> 

That's a good point. Will make the fallback paths consistent.

>> @@ -1103,6 +1170,12 @@ test_run_ () {
>>   		fi
>>   	fi
>>   
>> +	case ",$test_prereq," in
>> +	*,EXPENSIVE,*)
>> +		acquire_expensive_lock_
>> +		;;
>> +	esac
> 
> Because test_expect_success() and test_expect_failure() call test_skip()
> first, skipped tests never enter test_run_(), and the chainlint dry-run
> above this block runs before we take the lock.  Placing the lock around
> test_eval_() and outside its set -x block also keeps the polling loop
> out of -x trace logs under CI --verbose-log -x, while still releasing
> the lock before _error_exit() on --immediate failures.
> 
> Optional thought.  A small subtest in t/t0000-basic.sh seeding a stale
> expensive.lock with a dead PID or "$$" and checking that it is cleared
> and released (including under --immediate) could give quick regression
> coverage without any sleep delay.
>

Let me give this a shot. I'll keep it in a separate patch so that we 
could discuss it separately.

> Overall this is clean and well thought out.
> 
> Very nice.

That's good to hear :-)

-- 
Sivaraam

