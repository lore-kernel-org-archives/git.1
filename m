Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795862855;
	b=0p+NOw3AhgVZMiXEPLBjNTsmC7n9GH8bLg4cf2QwCeP+BDMzixB+UUFcYWCCrdrcj8XC
	 Q/FBsZSvr3lhYpryKuCrrhqSyqlpg00yBL3z4+A2mIucTlXYuyWfGV2xGexqgfDfrBbTu
	 sCmDYEfJyIlcQZN8IcYkL3IR6XWFo+t9z9OCt5FO8YAwDLvmvA/I/jolGE553M57emx/m
	 z/pOi4Me3mpHg/jXWLbrT7Cjrp53abxnyWSeW9GAOq36g5H8etdTJ6UFAhyVgcrU5obcG
	 fLVepx3YGGVSmLWCXEwpU+DjyQ0/sG/zMAYQdvJNiSzLh8uV8EXcOSvvMY0eXVNVLFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795862855;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WIbYWsiRpt0yS5hnZ/60Jr3dHCZs928bGIf9shB+wVg=;
	b=KCzUM57wCgXXPtFanEMdcnS6FuTYjEMs9xEid3COozR9IZU5cesJHk57AoVE6Df1FsPG
	 Fk4WUrqHuWVQQc3SbFpD5FWRXTIoeQ7OgRk/NJdK2XbGDGMWsWOQnEVSM9h6/aXAJ6WNO
	 MkQAyqoA/uThBTTKWran0bjdrjhufg/yi87qPPKKIfUv9ejTJVMf2KfqnWXjw1RIyrB40
	 s/bb3tAs+qyYMHOuVh0dbOfwXvG3HYub47KouBnHmEfaP5hz8tr0/8yUsfvez24bg206r
	 TE5ytXMUvohHf1iOXju1HDHIHRae1l2aHfQYUG8pwVdAQAfuBBUrR6u1aAh6Kv7sjDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FwgenRt0;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4953C606A31C
	for <git@vger.kernel.org>; Sat, 28 Nov 2026 10:47:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4953C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FwgenRt0
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-385d8a00598so14208867eec.1
        for <git@vger.kernel.org>; Sat, 28 Nov 2026 02:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795862854; x=1796467654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WIbYWsiRpt0yS5hnZ/60Jr3dHCZs928bGIf9shB+wVg=;
        b=FwgenRt0Bb1x2NjaVT7V1pWbV0AhlKO/vwbkLOIAGlEk51Qw06IH1tLcu601Qws/RC
         Q5aggWT3PZYyc22aVWbKzO1AidOGv1uoLHCx2SIYK72WldZfPRZboWzG8LX48WUISWPX
         IH0zHPrwlaOhoCIQlC9ZNGuSP6WjbMdjS9duIEQqlu94xWZhUEXDZS2lFgr3tKpeAygm
         OEOjlTmO4VY2o50nbRyZGivAMcq+ll8TO/h3dFRhnYiY2uepzCrZgpYFxu4K9DfswW4t
         On7YUbIPyl2CzgiPP2squaUccdp90q059Z3y/BU899F5d7jAEpunnhkGfPUGQZJHsw6T
         fHoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795862854; x=1796467654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WIbYWsiRpt0yS5hnZ/60Jr3dHCZs928bGIf9shB+wVg=;
        b=qvFerGublnldhXSSp5+WTp3IoJ0snUACmjQk7qi0cMa3zTiL+OJb/JEe8pOZpUbhIP
         PonIAOjg02bY46mSDYlM/tjryL8mUOkvNLAZmycPCIxePZHAlCq+jdMbKcO/grPKX5C0
         0LXtJlnAEHXeapyo4JAtplfxZ5o6KbpkNMcEwhZC1zD8fa2sM/Ti5w6X8im/KK5v5+QY
         bYpXYcy351GCQmgl043dCJ+u+TZo1tSBoXWrg9WFgtR7KCuBHefFwvg3VkLIPH9I1CSD
         91jo4CUz+90WIhUrj73a5gp8XNsx7MEh1JKxjW54/D/pN9huBwwVBJGL76+9NvBdve5X
         6+xg==
X-Gm-Message-State: APuU4Z/HkcBXymRtcCtAT0U585D7CZXjnqrB4PBqwJ8VEpoo0Eup9bAy
	8LnJe+4JANSS0hd7SxPopCo5llItjfryqozSnD2R6vyHYZaperjrrv4S
X-Gm-Gg: AZFdTZdBbbbDFZeIKeDbw3lDvbwytQRPeASYVAvW8Fd6h921p/S0tuyNoSNS34nZvzy
	SkpO/rmZoNRPUMhL9Y1hyOMJub9m0cVujqF6Zt9VVFk8UoHaLmRBRmVIxkokNbJvPTNPeAHr+pV
	vDi/TTCMoesMb5XiZ5HRE2cSEnWSsB9ZcYuRhFll0Cm+yDBScnXihpreIbcfoPo3oZkO2VlqrnZ
	kK+tBOJqoSkwYqSSjHRZ8LpuLaHzymRkQxUk8ga5aSekn25HrRXARXKbLA8uWabEPb/tHoXCIwm
	m4QwtzMR3TeK90gKd3fxIZD/+Hy8A8Cv6KXd8txwN569oDeSacKol+0JzjFGjI7WkKzoqGOW/1/
	gWWQB+UkDjt8dsvcRPSkKEw23iBhjODx3mvB4W/wWQdYU+GOMZEuL8hNgN9FcJoff0beacKOgZS
	m/JpcW/pgibbfvEUHc6mur+ksFz75PCAGVFfkptd5HaVEI3AlX/V82N/fe/2uOFDzVIFzA0aNvl
	FXsdOvGQIQZEj9ubKfsSaBnTF1gHcO+wkU41/hnER59vh3r6FEHcSfNW9+BdfjOkvu7kbASnRlZ
	V8l2GGWGTfQS0HOEpxKTXU9EbSKShGcoHvk81PfOyX83x/wu2B2myL088tpm/DId9qxsrG1kTkn
	VB+j3PzdKwdYDzW411w5L
X-Received: by 2002:a05:7300:fb97:b0:381:6ac8:ef2e with SMTP id 5a478bee46e88-3856ff5db0bmr37300684eec.25.1795862853803;
        Sat, 28 Nov 2026 02:47:33 -0800 (PST)
Received: from localhost.localdomain ([223.190.82.63])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c0c1dsm90661892eec.21.2026.11.28.02.47.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 28 Nov 2026 02:47:33 -0800 (PST)
From: Aniket Gupta <aniketgupta3001@gmail.com>
To: Matt Hunter <m@lfurio.us>
Cc: git@vger.kernel.org,
	Junio C Hamano <gitster@pobox.com>,
	Mike Beaton <mjsbeaton@gmail.com>,
	Phillip Wood <phillip.wood123@gmail.com>
Subject: Re: [PATCH] dir: do not turn blank ignore-file lines into patterns
Date: Sat, 28 Nov 2026 16:17:28 +0530
Message-ID: <20261128104728.77555-1-aniketgupta3001@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <DN6LDMN4UVPP.ZUG3AO2YOIZG@lfurio.us>
References: <CAHzAAWSi9D1mRL=A5-9GxzqQwo9jJ=45Hmxj3hVAF=8wkNZLmg@mail.gmail.com> <20261106182945.1316297-1-aniketgupta3001@gmail.com> <DN6LDMN4UVPP.ZUG3AO2YOIZG@lfurio.us>
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

> This avoids adding a pattern which becomes empty after stripping a
> carriage return and any spaces.  I wonder if it is also worth fixing up
> the parsing responsible for interpreting such "whitespace only" patterns
> to match ".*/"?  Either way, I think this patch is an improvement as-is.

I tried that. The empty pattern matches "foo/" because the basename of a
path with a trailing slash is empty and match_basename() compares it
with the empty pattern. Making match_basename() return 0 for an empty
pattern fixes blank line and also the lines "!", "/" and "!/", which my
patch leaves alone. With only "/" in the ignore file, "git check-ignore
-v foo/" still names that line. status, add, clean and ls-files give the
same output as before.

If this sits fine with you and Junio, I will do this in v2 rather than
skipping the line in add_patterns_from_buffer().
