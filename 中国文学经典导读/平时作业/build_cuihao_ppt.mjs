import fs from "node:fs/promises";
import path from "node:path";
import { fileURLToPath } from "node:url";

// Ensure artifact-tool runtime resolution works on Windows even if HOME is unset.
if (!process.env.HOME) {
  process.env.HOME = "C:\\Users\\13200";
}

import {
  createSlideContext,
  ensureArtifactToolWorkspace,
  importArtifactTool,
  saveBlobToFile,
} from "file:///C:/Users/13200/.codex/plugins/cache/openai-primary-runtime/presentations/26.521.10419/skills/presentations/scripts/artifact_tool_utils.mjs";


const root = path.dirname(fileURLToPath(import.meta.url));
const previewDir = path.join(root, "ppt_preview");
const outputPath = path.join(root, "姓名 学号 平时作业 崔颢与黄鹤楼——一首诗里的武汉.pptx");
const slideSize = { width: 1280, height: 720 };

const palette = {
  bg: "#F7F4ED",
  bgAlt: "#F2EEE4",
  ink: "#1B1B1B",
  muted: "#5F6368",
  green: "#1E5A55",
  greenSoft: "#D9E9E4",
  rust: "#A65336",
  rustSoft: "#F1DDD4",
  gold: "#B7893C",
  line: "#D8D1C5",
  white: "#FFFFFF",
};

const titleFont = "Microsoft YaHei";
const bodyFont = "Microsoft YaHei";

const poem = [
  "昔人已乘黄鹤去，此地空余黄鹤楼",
  "黄鹤一去不复返，白云千载空悠悠",
  "晴川历历汉阳树，芳草萋萋鹦鹉洲",
  "日暮乡关何处是？烟波江上使人愁",
];

function addBackground(ctx, slide, alt = false) {
  ctx.addShape(slide, {
    x: 0,
    y: 0,
    w: ctx.W,
    h: ctx.H,
    fill: alt ? palette.bgAlt : palette.bg,
  });
  ctx.addShape(slide, {
    x: 70,
    y: 56,
    w: 1140,
    h: 608,
    fill: "#00000000",
    line: ctx.line(palette.line, 1.2),
  });
}

function addHeader(ctx, slide, section, page) {
  ctx.addShape(slide, {
    x: 80,
    y: 40,
    w: 150,
    h: 26,
    fill: palette.greenSoft,
    line: ctx.line(palette.greenSoft, 0),
  });
  ctx.addText(slide, {
    x: 92,
    y: 44,
    w: 126,
    h: 20,
    text: section,
    fontSize: 12,
    bold: true,
    color: palette.green,
    face: bodyFont,
  });
  ctx.addText(slide, {
    x: 1110,
    y: 42,
    w: 80,
    h: 22,
    text: `0${page}`,
    fontSize: 13,
    color: palette.muted,
    align: "right",
    face: bodyFont,
  });
}

function addTitle(slide, ctx, title, subtitle) {
  ctx.addText(slide, {
    x: 100,
    y: 110,
    w: 820,
    h: 80,
    text: title,
    fontSize: 30,
    bold: true,
    color: palette.ink,
    face: titleFont,
  });
  ctx.addText(slide, {
    x: 100,
    y: 190,
    w: 720,
    h: 40,
    text: subtitle,
    fontSize: 15,
    color: palette.muted,
    face: bodyFont,
  });
}

function addBulletList(ctx, slide, items, x, y, w, lineGap = 18, fontSize = 20, color = palette.ink) {
  let top = y;
  for (const item of items) {
    ctx.addText(slide, {
      x,
      y: top,
      w,
      h: 54,
      text: `• ${item}`,
      fontSize,
      color,
      face: bodyFont,
    });
    top += 54 + lineGap;
  }
}

function addNoteCard(ctx, slide, { x, y, w, h, title, body, fill = palette.white, accent = palette.rust }) {
  ctx.addShape(slide, {
    x,
    y,
    w,
    h,
    fill,
    line: ctx.line(accent, 1.2),
  });
  ctx.addShape(slide, {
    x: x + 18,
    y: y + 18,
    w: 80,
    h: 22,
    fill: accent,
    line: ctx.line(accent, 0),
  });
  ctx.addText(slide, {
    x: x + 28,
    y: y + 20,
    w: 60,
    h: 18,
    text: title,
    fontSize: 11,
    bold: true,
    color: palette.white,
    face: bodyFont,
    align: "center",
  });
  ctx.addText(slide, {
    x: x + 22,
    y: y + 58,
    w: w - 44,
    h: h - 74,
    text: body,
    fontSize: 17,
    color: palette.ink,
    face: bodyFont,
  });
}

function addTimelineBar(ctx, slide, items) {
  ctx.addShape(slide, {
    x: 120,
    y: 505,
    w: 1040,
    h: 2,
    fill: palette.line,
    line: ctx.line(palette.line, 0),
  });
  const starts = [140, 410, 700, 980];
  items.forEach((item, index) => {
    ctx.addShape(slide, {
      x: starts[index],
      y: 492,
      w: 26,
      h: 26,
      fill: index % 2 === 0 ? palette.green : palette.rust,
      line: ctx.line(index % 2 === 0 ? palette.green : palette.rust, 0),
      geometry: "ellipse",
    });
    ctx.addText(slide, {
      x: starts[index] - 24,
      y: 532,
      w: 160,
      h: 50,
      text: item,
      fontSize: 15,
      color: palette.muted,
      face: bodyFont,
      align: "left",
    });
  });
}

async function buildDeck() {
  await ensureArtifactToolWorkspace(root);
  const artifact = await importArtifactTool(root);
  const { Presentation, PresentationFile } = artifact;
  const presentation = Presentation.create({ slideSize });
  const ctx = createSlideContext(artifact, {
    slideSize,
    workspaceDir: root,
    outputDir: root,
    titleFont,
    bodyFont,
  });

  // Slide 1
  {
    const slide = presentation.slides.add();
    addBackground(ctx, slide, false);
    ctx.addShape(slide, {
      x: 96,
      y: 96,
      w: 92,
      h: 26,
      fill: palette.rust,
      line: ctx.line(palette.rust, 0),
    });
    ctx.addText(slide, {
      x: 108,
      y: 100,
      w: 68,
      h: 18,
      text: "平时作业",
      fontSize: 12,
      bold: true,
      color: palette.white,
      face: bodyFont,
      align: "center",
    });
    ctx.addText(slide, {
      x: 96,
      y: 150,
      w: 560,
      h: 96,
      text: "崔颢与黄鹤楼",
      fontSize: 34,
      bold: true,
      color: palette.ink,
      face: titleFont,
    });
    ctx.addText(slide, {
      x: 96,
      y: 245,
      w: 620,
      h: 60,
      text: "一首诗里的武汉，一座城中的经典记忆",
      fontSize: 18,
      color: palette.muted,
      face: bodyFont,
    });
    ctx.addShape(slide, {
      x: 760,
      y: 110,
      w: 360,
      h: 430,
      fill: palette.white,
      line: ctx.line(palette.green, 1.4),
    });
    ctx.addText(slide, {
      x: 798,
      y: 150,
      w: 284,
      h: 300,
      text: poem.join("\n"),
      fontSize: 22,
      color: palette.green,
      face: "FangSong",
      align: "center",
      valign: "top",
    });
    ctx.addShape(slide, {
      x: 96,
      y: 465,
      w: 560,
      h: 98,
      fill: palette.greenSoft,
      line: ctx.line(palette.greenSoft, 0),
    });
    ctx.addText(slide, {
      x: 122,
      y: 492,
      w: 500,
      h: 48,
      text: "关键词：唐代诗人 / 武汉文化地标 / 黄鹤楼诗意 / 文学经典与城市记忆",
      fontSize: 18,
      color: palette.ink,
      face: bodyFont,
    });
    ctx.addText(slide, {
      x: 96,
      y: 612,
      w: 460,
      h: 24,
      text: "中国文学经典导读",
      fontSize: 12,
      color: palette.muted,
      face: bodyFont,
    });
  }

  // Slide 2
  {
    const slide = presentation.slides.add();
    addBackground(ctx, slide, true);
    addHeader(ctx, slide, "选题缘由", 2);
    addTitle(slide, ctx, "为什么选崔颢？", "他不是武汉籍，却用一首诗深刻影响了后人理解武汉的方式。");
    addBulletList(ctx, slide, [
      "《黄鹤楼》是最能代表武汉文学意象的唐诗之一。",
      "作品完整覆盖课程要求中的“作家概述 + 纪念活动 + 个人理解”。",
      "崔颢让黄鹤楼从地理名胜变成了文化名胜。",
    ], 110, 285, 560, 16, 21);
    addNoteCard(ctx, slide, {
      x: 760,
      y: 285,
      w: 360,
      h: 230,
      title: "核心判断",
      body: "与其说武汉因为黄鹤楼而有名，不如说黄鹤楼因为进入诗歌，才真正拥有了跨越千年的文化生命。",
      fill: palette.white,
      accent: palette.rust,
    });
  }

  // Slide 3
  {
    const slide = presentation.slides.add();
    addBackground(ctx, slide, false);
    addHeader(ctx, slide, "作家概述", 3);
    addTitle(slide, ctx, "崔颢其人", "盛唐诗人，最著名的代表作就是《黄鹤楼》。");
    addBulletList(ctx, slide, [
      "时代：唐代盛唐时期",
      "风格：擅长写景，也善于把空间感与情绪融合",
      "代表意义：以一首《黄鹤楼》奠定文学史地位",
      "与武汉关系：通过黄鹤楼书写，进入江城文化核心记忆",
    ], 110, 280, 520, 14, 20);
    addTimelineBar(ctx, slide, [
      "盛唐诗歌成熟期",
      "登临黄鹤楼写下名篇",
      "诗句进入武汉城市想象",
      "至今仍被持续传诵",
    ]);
    addNoteCard(ctx, slide, {
      x: 760,
      y: 280,
      w: 360,
      h: 170,
      title: "提示",
      body: "崔颢不是“因为生于武汉”而相关，而是“因为写出武汉最经典的诗意表达”而相关。",
      fill: palette.rustSoft,
      accent: palette.rust,
    });
  }

  // Slide 4
  {
    const slide = presentation.slides.add();
    addBackground(ctx, slide, true);
    addHeader(ctx, slide, "文本分析", 4);
    addTitle(slide, ctx, "《黄鹤楼》为什么动人？", "它把传说、眼前景色与个人乡愁写成了一个完整的精神空间。");
    ctx.addShape(slide, {
      x: 110,
      y: 272,
      w: 420,
      h: 310,
      fill: palette.white,
      line: ctx.line(palette.green, 1.2),
    });
    ctx.addText(slide, {
      x: 144,
      y: 308,
      w: 352,
      h: 240,
      text: poem.join("\n"),
      fontSize: 22,
      color: palette.green,
      face: "FangSong",
      align: "center",
    });
    addBulletList(ctx, slide, [
      "前两联：从黄鹤传说写起，历史感与空茫感同时出现",
      "颈联：汉阳树与鹦鹉洲展开开阔的武汉江景",
      "尾联：景尽而情出，落到最普遍也最深沉的“乡愁”",
    ], 590, 285, 520, 16, 19);
  }

  // Slide 5
  {
    const slide = presentation.slides.add();
    addBackground(ctx, slide, false);
    addHeader(ctx, slide, "经典意义", 5);
    addTitle(slide, ctx, "这首诗为什么会成为经典？", "不是只有名句流传，更重要的是它塑造了后人看待黄鹤楼、看待武汉的方式。");
    addNoteCard(ctx, slide, {
      x: 110,
      y: 285,
      w: 300,
      h: 230,
      title: "其一",
      body: "神话与现实自然连接，让黄鹤楼拥有文化纵深。",
      fill: palette.white,
      accent: palette.green,
    });
    addNoteCard(ctx, slide, {
      x: 450,
      y: 285,
      w: 300,
      h: 230,
      title: "其二",
      body: "意象层次鲜明，黄鹤、白云、汉阳树、鹦鹉洲共同构成强画面感。",
      fill: palette.white,
      accent: palette.rust,
    });
    addNoteCard(ctx, slide, {
      x: 790,
      y: 285,
      w: 300,
      h: 230,
      title: "其三",
      body: "最终落到“乡愁”，让作品跨越时代、持续被共鸣。",
      fill: palette.white,
      accent: palette.gold,
    });
  }

  // Slide 6
  {
    const slide = presentation.slides.add();
    addBackground(ctx, slide, true);
    addHeader(ctx, slide, "纪念活动", 6);
    addTitle(slide, ctx, "武汉怎样纪念崔颢与《黄鹤楼》？", "课程要求中的第二部分，可以从“城市文化空间”来理解。");
    addBulletList(ctx, slide, [
      "黄鹤楼景区长期以诗词讲解、碑刻展陈、文化展示强化《黄鹤楼》的地位。",
      "晴川阁因“晴川历历汉阳树”而与崔颢诗句形成稳定的城市联想。",
      "诗词邀请赛、背诗入园、夜游诗词互动，让经典进入当代公共文化生活。",
    ], 110, 285, 610, 12, 19);
    addNoteCard(ctx, slide, {
      x: 800,
      y: 290,
      w: 300,
      h: 250,
      title: "可以强调",
      body: "崔颢的纪念并不只是一座馆、一块碑，而是整座黄鹤楼文化空间对这首诗的持续引用与再生产。",
      fill: palette.rustSoft,
      accent: palette.rust,
    });
  }

  // Slide 7
  {
    const slide = presentation.slides.add();
    addBackground(ctx, slide, false);
    addHeader(ctx, slide, "个人理解", 7);
    addTitle(slide, ctx, "我对“文学经典与中国文化”的理解", "崔颢这首诗最打动我的，是它让城市空间获得了精神深度。");
    addBulletList(ctx, slide, [
      "文学经典能够塑造地方意象，让“地点”变成“文化名胜”。",
      "中国古典诗歌常把情感寄托在山川楼阁之中，因此更容易被长期记忆。",
      "经典并不只属于过去，它可以通过展陈、旅游、活动和教育继续活在当下。",
    ], 110, 290, 560, 16, 20);
    addNoteCard(ctx, slide, {
      x: 760,
      y: 295,
      w: 350,
      h: 210,
      title: "一句话总结",
      body: "黄鹤楼因为进入诗歌而成为经典地标，崔颢也因为写下黄鹤楼而成为与武汉紧密相连的古代作家。",
      fill: palette.greenSoft,
      accent: palette.green,
    });
  }

  // Slide 8
  {
    const slide = presentation.slides.add();
    addBackground(ctx, slide, true);
    addHeader(ctx, slide, "结语", 8);
    ctx.addText(slide, {
      x: 150,
      y: 175,
      w: 980,
      h: 70,
      text: "一首《黄鹤楼》，让崔颢留在了武汉，也让武汉留在了中国文学史里。",
      fontSize: 30,
      bold: true,
      color: palette.ink,
      face: titleFont,
      align: "center",
    });
    ctx.addShape(slide, {
      x: 290,
      y: 280,
      w: 700,
      h: 190,
      fill: palette.white,
      line: ctx.line(palette.green, 1.2),
    });
    ctx.addText(slide, {
      x: 330,
      y: 322,
      w: 620,
      h: 110,
      text: "谢谢大家\n\n可以从“文学如何塑造城市记忆”这个角度结束发言。",
      fontSize: 24,
      color: palette.green,
      face: bodyFont,
      align: "center",
      valign: "middle",
    });
  }

  await fs.mkdir(previewDir, { recursive: true });
  for (let i = 0; i < presentation.slides.count; i += 1) {
    const slide = presentation.slides.getItem(i);
    const preview = await presentation.export({ slide, format: "png", scale: 1 });
    await saveBlobToFile(preview, path.join(previewDir, `slide-${String(i + 1).padStart(2, "0")}.png`));
  }

  const pptx = await PresentationFile.exportPptx(presentation);
  await pptx.save(outputPath);
}

buildDeck().catch((error) => {
  console.error(error);
  process.exit(1);
});
