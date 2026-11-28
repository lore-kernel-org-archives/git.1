Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795860742;
	b=S6mxZlnqX9An9AXpiaj42Qoz5iLU7ADEAF8EewEmiZPfgVwCcxQHBzKzWfuShQaD2GJ2
	 +ok5mwweuvet8KBWKjafTbybAx0wkOyrncW+/Er2CUxdpUU7KiMUwpDY0xFMRYx8KWAiD
	 ccCUgekaFyd/OcRZnAbQFXOlZ4vHgb9UPswSLgFfwuFfKbfe+nHgcoQrMpCG971UEn1GK
	 ZcjiwaVnthVTbLTm0t6IhnibKYmk65fly2LLh5bsGGEQ2srTLYjmcl/Ek87ydamtJA30x
	 krZ0ox7G0DzqJVjiqik9PwoIvB+++qNQtC+SWNwENFr3PXiCmdbPA2Eco2bPU83WspQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795860742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YJIDxqbsuAhobzszSvza449f3qn0uzNLKIUYsf9PlwE=;
	b=rFmwFEwPb2OpKS002H/n8SCVI9l86cpmi9HDVJtwUoySA0MyM1fKRBLFqwlYqFo2aJj7
	 cKY8HOx9x/BEFc3lB6ZmgnCYkusDqG4O9Db6KLM3VGJz7qQ9dBZis08lYUae/g0gItB6G
	 FiZk4yxEw/E+VOLVaF3v6kwErfkPRB+gox1L2TzMynxy3nTqSvgkOEqwQnBvCnWdD5O8A
	 EE8knMWZKMapw0Tpkb2QtKLahoUgJ12Eo3jvGb+jXmQfdXhPFRaT4MB471Sesk4roA4Z+
	 5riWBypeZZ4Dc7e5siNeeGHOIvJ+XfQJZk1e8x0IuMGeZ4Rt3SclFaknVBmtCTwuUsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aKeKt2Pg;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8198C606A31C
	for <git@vger.kernel.org>; Sat, 28 Nov 2026 10:12:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8198C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aKeKt2Pg
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-18818daa3e7so4633368c88.0
        for <git@vger.kernel.org>; Sat, 28 Nov 2026 02:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795860741; x=1796465541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YJIDxqbsuAhobzszSvza449f3qn0uzNLKIUYsf9PlwE=;
        b=aKeKt2Pg8jGAybUr7a+THVcn3Rd5g7TBRkjmHxvPziKzm8IhfKi84HMtRDayC6XlpT
         y4Ef45VNH6MFltCmr+zWZM1FBaIfq7aMO6BbhdB3q1crflCuzCtj59NvLS1qc3NNTiAp
         QfuWj8gREgURQauKdhE8dHON6sCQvGvOtA5d2h3WEPPRmXWPSPg4kY+oKxWWsaezj7l5
         dT2JbTjyPNgq7NXVybD1P5p2wSgPhS5cBZ18Kv2cOxCVlUhhJq22NeAfsLxJxjQQuZmT
         xYpv3wBOaXdRbflXaEKJnhlJzMYDqzgXrRBiFDOqw7BnMm/s3Qa9GfT4MjII5GOKs75k
         TRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795860741; x=1796465541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YJIDxqbsuAhobzszSvza449f3qn0uzNLKIUYsf9PlwE=;
        b=1LihD2wuCRWToQEwACqdgjmnOWzkbLjPJgqPbntAY6qY4wzpsMrs4MyB1ZsPxfrMVE
         BScRaNcQJN6dDdxNYTUG5SkjVW9nAGY6gDq6rL1sUUp/mkKb4CgUPi/Gk2eT1d6lB6MI
         ZmA8pQp593s8DcyuBmekz+4Gvn7sNhkj54aXGAgmA1KpG4XK2H0NPzG/dV7dCABvJ84c
         I9JZcKNJP+SP2/qESKPNbLwbBVeKFOVAmgwa9wdw715823xTu5lLM1yhd8UXmYNGh0fW
         hZea45FtganH2zyB71qLpfjenZRnD/3GiahKNOfSL582sCqDLZMeCPN1eNtO/HyGurql
         l/yQ==
X-Gm-Message-State: APuU4Z9zR/bePtkZVulDVqxiU90LWifD7+d9bm7R+VOwqypygeHzbKgf
	dlpMB9ChQpHwoEvvsZ1+Skf8L6yR5oGi9OexxYaYvK4F3jop2zk+jKS4
X-Gm-Gg: AZFdTZeJRYGq+CoYS1DC5HBfuHQLBWBV1+LcdNG1stn9jwYkSC+VszB/gi1EB+xEEd4
	CHlUFP4RY8l20+UxOXXME7kSl7UWpsthoE6s5Cy++9w8Zd7dz5R6QDyVC3B3UGOcLAKfWvurZhO
	FRrvDpJIpcDTOk2r+6naW+tXUmKihYDRPfgxgSavkrWuPo/1WJb6YNx1UNd7wFqbebMAABhlw8L
	p2xvQSL+7HGU1RVBUnKTZLtoifTIZ2VzWcPzR37Zrj/3wnitdDvMg4OAFHY79hQ3wAP+4tILcaa
	/4oFJ3s3Y1zmBMPvJarycVvuw03+SZpVy0NwY/anr59Ii5/hdtt5nZDCetxbzB3aN1+nbDttpsE
	moNRfA42L8K93dH7qM8Ie+EkotDZ/YYuhkdc93PTy1dwuMWUx+OfY6UtocUxwLCbPo25dHtu9qD
	hi0rdTR9luoCCva3C+YO/c4XCAky/ynJYuiQKzeX4bM9w8pAkDkWmFx5z2uvZ1HM4mUXxKRZbDV
	dRuxByY+AOz1y2adtOo3HvzVjMWiKFgJCAZjjzqelfirTqb5QicJ9e//vaj96ovJVvKNrIdjlG8
	/gchcMK1PiWLQGTV1VXk+DJusFo7Iof3qJTqfUL52gYl/UcqY7XU7Q6ln5/IBe93cWw2PcUzXKZ
	2dvuBmbdzdIJpgfEMWHGq
X-Received: by 2002:a05:7022:f90b:b0:1b2:6d4d:9d8a with SMTP id a92af1059eb24-1b56f36d5fbmr17682819c88.2.1795860741510;
        Sat, 28 Nov 2026 02:12:21 -0800 (PST)
Received: from localhost.localdomain ([223.190.82.63])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b59d8c0cafsm9872972c88.7.2026.11.28.02.12.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 28 Nov 2026 02:12:21 -0800 (PST)
From: Aniket Gupta <aniketgupta3001@gmail.com>
To: Matt Hunter <m@lfurio.us>
Cc: git@vger.kernel.org,
	Junio C Hamano <gitster@pobox.com>,
	Mike Beaton <mjsbeaton@gmail.com>,
	Phillip Wood <phillip.wood123@gmail.com>
Subject: Re: [PATCH] dir: do not turn blank ignore-file lines into patterns
Date: Sat, 28 Nov 2026 15:42:16 +0530
Message-ID: <20261128101216.81769-1-aniketgupta3001@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <DN6QSHATQCMT.3UH09C5ENJUKY@lfurio.us>
References: <CAHzAAWSi9D1mRL=A5-9GxzqQwo9jJ=45Hmxj3hVAF=8wkNZLmg@mail.gmail.com> <20261106182945.1316297-1-aniketgupta3001@gmail.com> <DN6QSHATQCMT.3UH09C5ENJUKY@lfurio.us>
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

> The test doesn't actually need to create 'blank-dir'.  git-check-ignore
> seems to just check its input as _candidate_ filenames against the
> ignore rules.

Checked this. Without the fix check-ignore still reports "blank-dir/"
and with the fix it reports nothing. Will drop it in v2.
Thanks.
