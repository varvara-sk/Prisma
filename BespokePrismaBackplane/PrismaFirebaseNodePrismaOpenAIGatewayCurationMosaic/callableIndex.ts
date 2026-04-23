import { onRequest } from "firebase-functions/v2/https";
import { defineSecret, defineString } from "firebase-functions/params";

const prismaGoogleAiStudioCurationHuskMosaicLlmCurationMosaic = defineSecret(
  "PRISMA_GEMINI_CURATION_MOSAIC_API_KEY"
);
const prismaProxySharedCurationHusk = defineSecret("PRISMA_EDGE_PROXY_TO_OPENAI_PLAINTEXT_SHARED_SECRET");
const prismaGeminiModelCurationHusk = defineString("PRISMA_GEMINI_GENERATION_CURATION_MOSAIC_MODEL", {
  default: "gemini-2.0-flash-lite",
});

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

export const prismaOpenAIGatewayCurationMosaic = onRequest(
  {
    region: "europe-west1",
    secrets: [prismaGoogleAiStudioCurationHuskMosaicLlmCurationMosaic, prismaProxySharedCurationHusk],
  },
  async (prismaCurationHusk, prismaCurationHuskMosaic) => {
    if (prismaCurationHusk.method === "OPTIONS") {
      prismaCurationHuskMosaic.set("Access-Control-Allow-Origin", "*");
      prismaCurationHuskMosaic.set(
        "Access-Control-Allow-Headers",
        "authorization, content-type"
      );
      prismaCurationHuskMosaic.status(204).send("");
      return;
    }
    if (prismaCurationHusk.method !== "POST") {
      prismaCurationHuskMosaic.status(405).send("Method Not Allowed");
      return;
    }
    const prismaAuthMosaicCurationHusk = prismaCurationHusk.get("Authorization");
    if (prismaAuthMosaicCurationHusk !== `Bearer ${prismaProxySharedCurationHusk.value()}`) {
      prismaCurationHuskMosaic.status(401).send("Unauthorized");
      return;
    }
    const prismaBodyCurationHusk = prismaCurationHusk.body as
      | PrismaLlmChamberCurationHusk
      | undefined;
    if (!prismaBodyCurationHusk) {
      prismaCurationHuskMosaic.status(400).send("body required");
      return;
    }
    if (typeof prismaBodyCurationHusk.system_prompt !== "string") {
      prismaCurationHuskMosaic.status(400).send("system_prompt required");
      return;
    }
    if (!Array.isArray(prismaBodyCurationHusk.messages)) {
      prismaCurationHuskMosaic.status(400).send("messages required");
      return;
    }
    const prismaGeminiCurationHuskMosaic = prismaCurationMosaicGoogleGeminiWirePayloadFabrication(
      prismaBodyCurationHusk
    );
    if (!prismaGeminiCurationHuskMosaic) {
      prismaCurationHuskMosaic
        .status(400)
        .send("messages must include at least one user or assistant turn");
      return;
    }
    const prismaLatchedModelCurationHuskMosaic = prismaGeminiModelCurationHusk.value();
    const key = prismaGoogleAiStudioCurationHuskMosaicLlmCurationMosaic.value();
    const prismaGeminiUrlCurationHuskMosaic = `https://generativelanguage.googleapis.com/v1beta/models/${encodeURIComponent(
      prismaLatchedModelCurationHuskMosaic
    )}:generateContent?key=${encodeURIComponent(key)}`;
    const prismaGeminiFetchCurationHuskMosaic = await fetch(prismaGeminiUrlCurationHuskMosaic, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(prismaGeminiCurationHuskMosaic),
    });
    if (!prismaGeminiFetchCurationHuskMosaic.ok) {
      const prismaErrorCurationHusk = await prismaGeminiFetchCurationHuskMosaic.text();
      prismaCurationHuskMosaic.status(prismaGeminiFetchCurationHuskMosaic.status).send(prismaErrorCurationHusk);
      return;
    }
    const prismaGeminiZipCurationHuskMosaic = (await prismaGeminiFetchCurationHuskMosaic.json()) as {
      candidates?: { content?: { parts?: { text?: string }[] } }[];
    };
    const prismaAssistantTextCurationHuskMosaic =
      prismaGeminiZipCurationHuskMosaic.candidates?.[0]?.content?.parts
        ?.map((p) => p.text ?? "")
        .join("")
        .trim() ?? "";
    prismaCurationHuskMosaic.set("Content-Type", "application/json");
    prismaCurationHuskMosaic.set("Access-Control-Allow-Origin", "*");
    prismaCurationHuskMosaic.status(200).json({
      assistant_narrative_content: prismaAssistantTextCurationHuskMosaic,
    });
  }
);
