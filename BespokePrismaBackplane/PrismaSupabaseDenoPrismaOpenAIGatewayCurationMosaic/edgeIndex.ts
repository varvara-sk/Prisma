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
};

type PrismaProxyApiChatCompletionChoiceMosaic = {
  message?: { content?: string | { text?: string }[] };
};

function prismaHeaderSafeSecretCurationHusk(prismaIncomingSecretCurationHusk: string | undefined) {
  return prismaIncomingSecretCurationHusk?.trim().replace(/[^\x20-\x7E]/g, "");
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
      { role: "system" as const, content: prismaBody.system_prompt },
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
  const prismaLatchedModelCurationHuskMosaic =
    prismaProxyApiModelCurationHusk ?? "anthropic/claude-opus-4-7";
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
