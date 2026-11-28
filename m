Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=157.230.60.252
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795855503;
	b=zZSdWtPsKyDjl8i7Dgh5rZR5nJIDVXJmGwSXS0Wk+LbvCqJjbjv/9/AVxQrGvDETRtH6
	 U9TD0G3bgqkoOjsRzx4FQ17QyAUwnLuPuEjp6qr82RoNKcMi4Y4A/LazXKw/WYWJqg2Tw
	 UVTb58UEEGj6/88yg09SOatBhUmR5wmXUsrctmGmn52IxPWIM067FCcchyKQfDYiWDnmP
	 eqWStio8iF3nzTa+DZqRtsJqUpdJR/yn7w5M6VY4eV7n8kGDyaup9hx6IyfbTyKjzL3PI
	 Jh3nnOVg98ynwBnpgzixX8zsCm/QtOBUZvW3mxmOaBd4oh6Qed1lB/2cg0eUtazmjOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795855503;
	h=DMARC-Filter:DKIM-Signature:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:To:From:
	 Subject:X-Mailer:References:In-Reply-To;
	bh=AG5eEKmXTyj0OQAJ4OEWKQfP6+70HVBzs0XvNn6BMg8=;
	b=SGNWKTKvXINcKWSaZQdhd3RaZmxDTZSHN2wQCkvs0CcVRyqllF5XDDU88JjRtoQ3a1qb
	 EUHYAmhyk6BbRwBYlaG2bUVhm4tSaZIV6aMbwIua3rGAMuqMpYFsf1c+iuhDXcyQQAabv
	 vRssmKKobUcRrpUMKsHTayOrCrTObr1WiaUWr5xzJcUF6o9tBOW2fToPADBSiZSoO7fgw
	 O2BheVL+DqjDNWLel9xEdBjhA6V/Oy4uTNGZKzUPU8x+HfHPSkT6pbOvNjtpJ+g5YcB4m
	 Z9nPuDlSiuDa+/LGUcrWxT4Kb6tqYweCmRyV2uFAXa3jNW8SeL748Bey/ecXwCtkGxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lfurio.us;
	spf=pass smtp.mailfrom=lfurio.us;
	dkim=pass header.d=lfurio.us header.i=@lfurio.us header.a=rsa-sha256 header.s=default header.b=NA8wu5ze;
	arc=none smtp.remote-ip=157.230.60.252
Received: from mail.normalmode.org (h01.normalmode.org [157.230.60.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8B4606A31C
	for <git@vger.kernel.org>; Sat, 28 Nov 2026 08:45:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB8B4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lfurio.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lfurio.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=lfurio.us header.i=@lfurio.us header.a=rsa-sha256 header.s=default header.b=NA8wu5ze
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lfurio.us; s=default;
	t=1795855501; bh=AG5eEKmXTyj0OQAJ4OEWKQfP6+70HVBzs0XvNn6BMg8=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=NA8wu5zeJOHc3K1x961jrvfMtSkgGuViYhMFFAuqT4YBAyFPbEVFQbKhl7LSvyLMq
	 VcB1G8A7bbLjtCiO3fS8H6ESwli+GIRJ7q0iGjEV73h3aXWgUbeDUzSAraLwjGJXHF
	 jVFikJmyRDSbDof47GDhZd/ZCwS2w1fwc06FDKOE=
Received: by mail.normalmode.org (Postfix) with ESMTPSA id 6ACB360665;
	Sat, 28 Nov 2026 08:45:01 +0000 (UTC)
X-Mailing-List: git@vger.kernel.org
List-Id: <git.vger.kernel.org>
List-Post: <mailto:git@vger.kernel.org>
List-Help: <mailto:git+help@vger.kernel.org>
List-Subscribe: <mailto:git+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:git+unsubscribe@vger.kernel.org>
List-Owner: <mailto:git+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Nov 2026 03:44:34 -0500
Message-Id: <DN6PMVT20638.3D2CG0PJ6RIXX@lfurio.us>
Cc: <git@vger.kernel.org>
To: "Colin Hinton" <colinlewishinton@gmail.com>, "Junio C Hamano"
 <gitster@pobox.com>
From: "Matt Hunter" <m@lfurio.us>
Subject: Re: [PATCH v2] remote.c: defer remote.<name>.followRemoteHEAD
 validation
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261018235508.848-1-colinlewishinton@gmail.com>
 <20261023185007.21642-1-colinlewishinton@gmail.com>
 <xmqqecdezfr1.fsf@gitster.g>
 <CAHeTm9NOqLA=BfTU9ABDFt8+jOzaRDPRrMNP8thzAQN2NVZAew@mail.gmail.com>
 <xmqqmrrxdhox.fsf@gitster.g> <DMHZCS9LOW3N.ZJ3947HUCXZ8@lfurio.us>
 <xmqq33tnz0hb.fsf@gitster.g> <DMJFKJCI5DLL.12R7AMFO4DK2Y@lfurio.us>
 <xmqqjymqobc3.fsf@gitster.g> <DMO0XC1PL4MP.1J5830XZ4GCS5@lfurio.us>
 <xmqq1p8ylywh.fsf@gitster.g>
 <CAHeTm9M5maWM=yrJPNzCibv_rewH3-yBK8J5-MDyDvPzfihe4A@mail.gmail.com>
In-Reply-To: <CAHeTm9M5maWM=yrJPNzCibv_rewH3-yBK8J5-MDyDvPzfihe4A@mail.gmail.com>

On Sun Nov 8, 2026 at 4:45 PM EST, Colin Hinton wrote:
> I prefer Matt's approach as I agree it's cleaner and simpler by
> removing the setup at the call site. I'll adopt it into my next
> version and will give credit to Matt for his contribution.
>
> I am still holding on to the re-roll until hn/fetch-refmap is accepted
> into 'next', so that I can rebase and resolve any conflicts myself.
> Junio, if you think there is a better branch for me to base this off
> of so that I can begin the conflict resolution now please let me know.

I don't think it is this topic's responsibility to do so, when it is so
close to completion, and especially with what Phillip has said in the
other thread [1].

The second refactoring patch that Junio suggested proactively
deconflicts to a reasonable degree.

[1] https://lore.kernel.org/git/1276fcfe-9f2c-4a2c-ade9-b88f33ae5d84@gmail.=
com/
