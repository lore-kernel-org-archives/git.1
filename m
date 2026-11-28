Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=157.230.60.252
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795858762;
	b=U0wuIiqybfX+/Qiij2D0hgIMbIY/SK8tRLFK86N2bIKAszAFdRyYd5hh/ThOVBKYlKWy
	 e1o3dyEt+s9waR/w6yTz1dRVGS77qtjVqEXGTYvknEz7+wjOtMtRsS3V0jeUyZA+j+sbP
	 V+ht4SVMZpQuDe65eyRa/02VEa/5cn2dBG1jZuuJ81EFAxIopvQhGAVfHFXyYyw2I0fx6
	 VGpp/0yviA+ktvYdtFoPga+c8fbTeChUFnczBiwgxDo0Ajt56ldBTe2rwD/qHjXjFpmWU
	 XdWwGbkAsc0MkNZsrzj6IOnZSjiDoQA49iifAQByOUbr5dqoMNi4LzeTekheWT+GNOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795858762;
	h=DMARC-Filter:DKIM-Signature:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:To:
	 From:X-Mailer:References:In-Reply-To;
	bh=N32I84vA1WnDqv5DUzLpdOxIAVd/kt8dxfvgT/n/pUQ=;
	b=SgCQqTmA9xVxWVWe2ysneT+n52VjkrvjG+sBDEBFNLZj6D7/xG2NL+IZyclMBzSVikRs
	 fPMgOEBXFxYJDqYd+eVARb6Fh8ZT1FZIdbpvdM/r1Vz3uIVMGuSf+YJjWQujFHrlaXBon
	 R1RvRnrNNUG2a9Z70JFBB8trqmzocitYbFWkRVJem1z0+V9LLa17P/hlTGRi6WdXgRQxI
	 S8RwKG2sLJkNjufPRG3Gl/AKSSY0F6IaGG8iupVyzOjb6dKXo9eVk/6KY0gu6LzTN9IZI
	 h4A+kc0QGEUKKTMJFSQRO4bZqjxc3of0LPHMESWM/llR03UGaLozjo1QzJ2DfTUFeTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lfurio.us;
	spf=pass smtp.mailfrom=lfurio.us;
	dkim=pass header.d=lfurio.us header.i=@lfurio.us header.a=rsa-sha256 header.s=default header.b=hyoV8gZj;
	arc=none smtp.remote-ip=157.230.60.252
Received: from mail.normalmode.org (h01.normalmode.org [157.230.60.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B25606A31F
	for <git@vger.kernel.org>; Sat, 28 Nov 2026 09:39:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47B25606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lfurio.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lfurio.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lfurio.us header.i=@lfurio.us header.a=rsa-sha256 header.s=default header.b=hyoV8gZj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lfurio.us; s=default;
	t=1795858761; bh=1vM0F+LcyGFH8dSib9kW7ZD+AXbEKlH3hBbSoRni0sg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=hyoV8gZjALbL06EJ+Y/ndgdY6Yc8RvYW7VUELdkdEeYjWKpksNqjZeR5f7Bd9XN9Y
	 RvAYGXpWbyk0drxnBEPwunrqjVvGW/xPp4a8YDnskfWO0Xp3CaCCpV83EKVNqfOIdV
	 L+OyroOPXEr/OT4RozyOddosBSGJUvJQhfdhRn2U=
Received: by mail.normalmode.org (Postfix) with ESMTPSA id 00D7E60665;
	Sat, 28 Nov 2026 09:39:20 +0000 (UTC)
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
Date: Sat, 28 Nov 2026 04:38:54 -0500
Message-Id: <DN6QSHATQCMT.3UH09C5ENJUKY@lfurio.us>
Subject: Re: [PATCH] dir: do not turn blank ignore-file lines into patterns
Cc: "Junio C Hamano" <gitster@pobox.com>, "Mike Beaton"
 <mjsbeaton@gmail.com>
To: "Aniket Gupta" <aniketgupta3001@gmail.com>, <git@vger.kernel.org>
From: "Matt Hunter" <m@lfurio.us>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <CAHzAAWSi9D1mRL=A5-9GxzqQwo9jJ=45Hmxj3hVAF=8wkNZLmg@mail.gmail.com> <20261106182945.1316297-1-aniketgupta3001@gmail.com>
In-Reply-To: <20261106182945.1316297-1-aniketgupta3001@gmail.com>

One more thing I saw...

On Fri Nov 6, 2026 at 1:29 PM EST, Aniket Gupta wrote:
> =20
> +test_expect_success 'blank lines are not patterns' '
> +	mkdir blank-dir &&
> +	printf "\r\n   \n   \r\n" >blank-ignore &&
> +	test_expect_code 1 git -c core.excludesfile=3Dblank-ignore check-ignore=
 blank-dir/ >actual &&

The test doesn't actually need to create 'blank-dir'.  git-check-ignore
seems to just check its input as _candidate_ filenames against the
ignore rules.

> +	test_must_be_empty actual
> +'
> +
>  test_expect_success !MINGW 'quoting allows trailing whitespace' '
>  	rm -rf whitespace &&
>  	mkdir whitespace &&
