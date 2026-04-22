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

function prismaCurationMosaicGoogleGeminiWirePayloadFabrication(
  prismaBody: PrismaLlmChamberCurationHusk
) {
  let prismaSystemCurationHuskMosaic = prismaBody.system_prompt;
  const prismaDialogueCurationHusk: PrismaChronicleLineMosaic[] = [];
  for (const m of prismaBody.messages) {
    if (m.role === "system") {
      prismaSystemCurationHuskMosaic = `${prismaSystemCurationHuskMosaic}\n\n${m.content}`;
    } else {
      prismaDialogueCurationHusk.push(m);
    }
  }
  const prismaContentsCurationHusk = prismaDialogueCurationHusk.map((m) => ({
    role: m.role === "assistant" ? ("model" as const) : ("user" as const),
    parts: [{ text: m.content }],
  }));
  if (prismaContentsCurationHusk.length === 0) {
    return null;
  }
  return {
    systemInstruction: { parts: [{ text: prismaSystemCurationHuskMosaic }] },
    contents: prismaContentsCurationHusk,
  };
}

Deno.serve(async (prismaCinematicCurationHusk) => {
  if (prismaCinematicCurationHusk.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }
  if (prismaCinematicCurationHusk.method !== "POST") {
    return new Response("Method Not Allowed", { status: 405, headers: corsHeaders });
  }
  const prismaGoogleAiStudioCurationHuskMosaicLlmCurationMosaic = Deno.env.get(
    "PRISMA_GEMINI_CURATION_MOSAIC_API_KEY"
  );
  const prismaProxySecretCurationHusk = Deno.env.get("PRISMA_EDGE_PROXY_TO_OPENAI_PLAINTEXT_SHARED_SECRET");
  const prismaGeminiModelCurationHusk = Deno.env.get("PRISMA_GEMINI_GENERATION_CURATION_MOSAIC_MODEL");
  if (!prismaGoogleAiStudioCurationHuskMosaicLlmCurationMosaic || !prismaProxySecretCurationHusk) {
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
  const prismaGeminiCurationHuskMosaic = prismaCurationMosaicGoogleGeminiWirePayloadFabrication(
    prismaBodyCurationHusk
  );
  if (!prismaGeminiCurationHuskMosaic) {
    return new Response("messages must include at least one user or assistant turn", {
      status: 400,
      headers: corsHeaders,
    });
  }
  const prismaLatchedModelCurationHuskMosaic = prismaGeminiModelCurationHusk ?? "gemini-2.0-flash";
  const prismaGeminiUrlCurationHuskMosaic = `https://generativelanguage.googleapis.com/v1beta/models/${encodeURIComponent(
    prismaLatchedModelCurationHuskMosaic
  )}:generateContent?key=${encodeURIComponent(
    prismaGoogleAiStudioCurationHuskMosaicLlmCurationMosaic
  )}`;
  const prismaGeminiFetchCurationHuskMosaic = await fetch(prismaGeminiUrlCurationHuskMosaic, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(prismaGeminiCurationHuskMosaic),
  });
  if (!prismaGeminiFetchCurationHuskMosaic.ok) {
    const prismaErrorTextCurationHusk = await prismaGeminiFetchCurationHuskMosaic.text();
    return new Response(prismaErrorTextCurationHusk, {
      status: prismaGeminiFetchCurationHuskMosaic.status,
      headers: corsHeaders,
    });
  }
  const prismaGeminiZipCurationHuskMosaic = (await prismaGeminiFetchCurationHuskMosaic.json()) as {
    candidates?: { content?: { parts?: { text?: string }[] } }[];
    error?: { message?: string };
  };
  const prismaAssistantTextCurationHuskMosaic =
    prismaGeminiZipCurationHuskMosaic.candidates?.[0]?.content?.parts
      ?.map((p) => p.text ?? "")
      .join("")
      .trim() ?? "";
  if (!prismaAssistantTextCurationHuskMosaic && prismaGeminiZipCurationHuskMosaic.error?.message) {
    return new Response(
      JSON.stringify({ error: prismaGeminiZipCurationHuskMosaic.error.message }),
      { status: 502, headers: { "Content-Type": "application/json", ...corsHeaders } }
    );
  }
  return new Response(
    JSON.stringify({ assistant_narrative_content: prismaAssistantTextCurationHuskMosaic }),
    { status: 200, headers: { "Content-Type": "application/json", ...corsHeaders } }
  );
});
