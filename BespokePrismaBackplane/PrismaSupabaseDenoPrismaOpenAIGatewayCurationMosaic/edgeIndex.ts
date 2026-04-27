import "jsr:@supabase/functions-js/edge-runtime.d.ts";

const corsHeaders: Record<string, string> = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers":
    "authorization, x-client-info, apikey, content-type",
};

type PrismaChronicleLineMosaic = { role: "system" | "user" | "assistant"; content: string };
type PrismaLlmChamberCurationHusk = {
  system_prompt: string;
  messages: PrismaChronicleLineMosaic[];
  is_premium?: boolean;
  chat_model?: string;
};

type PrismaProxyApiChatCompletionChoiceMosaic = {
  message?: { content?: string | { text?: string }[] };
};

function prismaHeaderSafeSecretCurationHusk(prismaIncomingSecretCurationHusk: string | undefined) {
  return prismaIncomingSecretCurationHusk?.trim().replace(/[^\x20-\x7E]/g, "");
}

const prismaBaseObjectiveSystemPromptCurationHusk = [
  "Ты — Prisma, эмпатичный, но абсолютно объективный аналитик отношений.",
  "Твоя цель — помочь пользователю осознать свои эмоции, увидеть ситуацию со стороны и наладить экологичную коммуникацию.",
  "Никакой слепой поддержки: если пользователь описывает свое токсичное поведение, истерики, слежку или оскорбления, не оправдывай его. Мягко, через Сократовский диалог, укажи на нарушение границ.",
  "Всегда рассматривай ситуацию с двух сторон. Объясняй возможные мотивы партнера, не демонизируя его, но и не оправдывая реальный абьюз.",
  "Никогда не говори «брось его», «разведись», «заблокируй». Решение всегда принимает пользователь. Ты показываешь варианты развития событий.",
  "Не используй диагнозы и медицинские клейма: «нарцисс», «психопат», «биполярка». Описывай поведение.",
  "Переводи обвинения в фокус на чувства и потребности пользователя через Я-сообщения.",
].join(" ");

const prismaCrisisCardTextCurationHusk = [
  "Prisma: Мы беспокоимся о вас.",
  "Похоже, вы находитесь в острой кризисной ситуации или вам угрожает опасность. Prisma — это ИИ, и мы не можем оказать вам ту помощь, которую вы сейчас заслуживаете. Пожалуйста, не оставайтесь одни.",
  "Единый телефон спасения (РФ): 112",
  "Горячая линия психологической помощи: 8 (495) 051",
  "Центр помощи при домашнем насилии «Насилию.нет»: 8 (495) 916-30-00",
].join("\n\n");

const prismaCrisisTriggerPatternCurationHusk = new RegExp(
  [
    "суицид",
    "убить\\s+себя",
    "не\\s+хочу\\s+жить",
    "покончить\\s+с\\s+собой",
    "он\\s+меня\\s+бь[её]т",
    "ударил",
    "боюсь\\s+за\\s+свою\\s+жизнь",
    "селфхарм",
    "режу\\s+себя",
  ].join("|"),
  "i"
);

function prismaContainsCrisisTriggerCurationHusk(prismaBody: PrismaLlmChamberCurationHusk) {
  return prismaBody.messages.some((m) => prismaCrisisTriggerPatternCurationHusk.test(m.content));
}

const prismaFreeChatModelCurationHusk = "openai/gpt-4o-mini";
const prismaPremiumChatModelAllowlistCurationHusk = new Set([
  "openai/gpt-4o-mini",
  "openai/gpt-5.4",
  "anthropic/claude-opus-4-7",
  "gemini/gemini-2.5-flash",
]);

function prismaResolveRequestedChatModelCurationHusk(
  prismaBody: PrismaLlmChamberCurationHusk,
  prismaPremiumFallbackModel: string | undefined
) {
  if (!prismaBody.is_premium) {
    return prismaFreeChatModelCurationHusk;
  }
  const prismaRequestedModel = prismaBody.chat_model?.trim();
  if (prismaRequestedModel && prismaPremiumChatModelAllowlistCurationHusk.has(prismaRequestedModel)) {
    return prismaRequestedModel;
  }
  return prismaPremiumFallbackModel ?? "anthropic/claude-opus-4-7";
}

function prismaCurationMosaicProxyApiOpenAIWirePayloadFabrication(
  prismaBody: PrismaLlmChamberCurationHusk,
  prismaModelCurationHusk: string
) {
  const prismaDialogueCurationHusk = prismaBody.messages.filter((m) =>
    m.role === "user" || m.role === "assistant" || m.role === "system"
  );
  const prismaPayloadCurationHusk: Record<string, unknown> = {
    model: prismaModelCurationHusk,
    messages: [
      { role: "system" as const, content: `${prismaBaseObjectiveSystemPromptCurationHusk}\n\n${prismaBody.system_prompt}` },
      ...prismaDialogueCurationHusk,
    ],
  };
  if (prismaModelCurationHusk.startsWith("openai/gpt-5") || prismaModelCurationHusk.startsWith("openai/o")) {
    prismaPayloadCurationHusk.max_completion_tokens = 1600;
  } else {
    prismaPayloadCurationHusk.max_tokens = 1600;
  }
  return prismaPayloadCurationHusk;
}

Deno.serve(async (prismaCinematicCurationHusk) => {
  if (prismaCinematicCurationHusk.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }
  if (prismaCinematicCurationHusk.method !== "POST") {
    return new Response("Method Not Allowed", { status: 405, headers: corsHeaders });
  }
  const prismaProxyApiCurationHuskMosaicLlmCurationMosaic = Deno.env.get(
    "PRISMA_PROXYAPI_CURATION_MOSAIC_API_KEY"
  );
  const prismaProxyApiHeaderSecretCurationHusk = prismaHeaderSafeSecretCurationHusk(
    prismaProxyApiCurationHuskMosaicLlmCurationMosaic
  );
  const prismaProxySecretCurationHusk = Deno.env.get("PRISMA_EDGE_PROXY_TO_OPENAI_PLAINTEXT_SHARED_SECRET")?.trim();
  const prismaProxyApiModelCurationHusk = Deno.env.get("PRISMA_PROXYAPI_GENERATION_CURATION_MOSAIC_MODEL")?.trim();
  if (!prismaProxyApiHeaderSecretCurationHusk || !prismaProxySecretCurationHusk) {
    return new Response("Server configuration incomplete", { status: 500, headers: corsHeaders });
  }
  const prismaAuthHeaderCurationHusk = prismaCinematicCurationHusk.headers.get("Authorization");
  if (prismaAuthHeaderCurationHusk !== `Bearer ${prismaProxySecretCurationHusk}`) {
    return new Response("Unauthorized", { status: 401, headers: corsHeaders });
  }
  let prismaBodyCurationHusk: PrismaLlmChamberCurationHusk;
  try {
    prismaBodyCurationHusk = (await prismaCinematicCurationHusk.json()) as PrismaLlmChamberCurationHusk;
  } catch {
    return new Response("Invalid JSON", { status: 400, headers: corsHeaders });
  }
  if (typeof prismaBodyCurationHusk.system_prompt !== "string") {
    return new Response("system_prompt required", { status: 400, headers: corsHeaders });
  }
  if (!Array.isArray(prismaBodyCurationHusk.messages)) {
    return new Response("messages required", { status: 400, headers: corsHeaders });
  }
  const prismaHasDialogueTurnCurationHusk = prismaBodyCurationHusk.messages.some((m) =>
    m.role === "user" || m.role === "assistant"
  );
  if (!prismaHasDialogueTurnCurationHusk) {
    return new Response("messages must include at least one user or assistant turn", {
      status: 400,
      headers: corsHeaders,
    });
  }
  if (prismaContainsCrisisTriggerCurationHusk(prismaBodyCurationHusk)) {
    return new Response(
      JSON.stringify({
        crisis_state: true,
        assistant_narrative_content: prismaCrisisCardTextCurationHusk,
      }),
      { status: 200, headers: { "Content-Type": "application/json", ...corsHeaders } }
    );
  }
  const prismaLatchedModelCurationHuskMosaic = prismaResolveRequestedChatModelCurationHusk(
    prismaBodyCurationHusk,
    prismaProxyApiModelCurationHusk
  );
  const prismaProxyApiCurationHuskMosaic = prismaCurationMosaicProxyApiOpenAIWirePayloadFabrication(
    prismaBodyCurationHusk,
    prismaLatchedModelCurationHuskMosaic
  );
  let prismaProxyApiFetchCurationHuskMosaic: Response;
  try {
    prismaProxyApiFetchCurationHuskMosaic = await fetch("https://openai.api.proxyapi.ru/v1/chat/completions", {
      method: "POST",
      headers: {
        "Authorization": `Bearer ${prismaProxyApiHeaderSecretCurationHusk}`,
        "Content-Type": "application/json",
      },
      body: JSON.stringify(prismaProxyApiCurationHuskMosaic),
    });
  } catch (prismaProxyApiDispatchErrorCurationHusk) {
    const prismaErrorMessageCurationHusk = prismaProxyApiDispatchErrorCurationHusk instanceof Error
      ? prismaProxyApiDispatchErrorCurationHusk.message
      : "ProxyAPI dispatch failed";
    return new Response(
      JSON.stringify({ error: prismaErrorMessageCurationHusk }),
      { status: 502, headers: { "Content-Type": "application/json", ...corsHeaders } }
    );
  }
  if (!prismaProxyApiFetchCurationHuskMosaic.ok) {
    const prismaErrorTextCurationHusk = await prismaProxyApiFetchCurationHuskMosaic.text();
    return new Response(prismaErrorTextCurationHusk, {
      status: prismaProxyApiFetchCurationHuskMosaic.status,
      headers: corsHeaders,
    });
  }
  let prismaProxyApiZipCurationHuskMosaic: {
    choices?: PrismaProxyApiChatCompletionChoiceMosaic[];
    error?: { message?: string };
  };
  try {
    prismaProxyApiZipCurationHuskMosaic = (await prismaProxyApiFetchCurationHuskMosaic.json()) as {
      choices?: PrismaProxyApiChatCompletionChoiceMosaic[];
      error?: { message?: string };
    };
  } catch {
    return new Response(
      JSON.stringify({ error: "ProxyAPI response parsing failed" }),
      { status: 502, headers: { "Content-Type": "application/json", ...corsHeaders } }
    );
  }
  const prismaAssistantContentCurationHuskMosaic =
    prismaProxyApiZipCurationHuskMosaic.choices?.[0]?.message?.content;
  const prismaAssistantTextCurationHuskMosaic = Array.isArray(prismaAssistantContentCurationHuskMosaic)
    ? prismaAssistantContentCurationHuskMosaic.map((p) => p.text ?? "").join("").trim()
    : (prismaAssistantContentCurationHuskMosaic ?? "").trim();
  if (!prismaAssistantTextCurationHuskMosaic && prismaProxyApiZipCurationHuskMosaic.error?.message) {
    return new Response(
      JSON.stringify({ error: prismaProxyApiZipCurationHuskMosaic.error.message }),
      { status: 502, headers: { "Content-Type": "application/json", ...corsHeaders } }
    );
  }
  return new Response(
    JSON.stringify({ assistant_narrative_content: prismaAssistantTextCurationHuskMosaic }),
    { status: 200, headers: { "Content-Type": "application/json", ...corsHeaders } }
  );
});
