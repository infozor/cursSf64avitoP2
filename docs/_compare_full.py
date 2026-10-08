# -*- coding: utf-8 -*-
from docx import Document
from pathlib import Path

path = Path(__file__).parent / "sf64avitoP2_template_p1_p6.docx"
d = Document(path)
lines = []
for i, p in enumerate(d.paragraphs):
    t = p.text.strip().replace("\n", " ")[:85]
    num_id = ilvl = None
    if p._element.pPr is not None and p._element.pPr.numPr is not None:
        n = p._element.pPr.numPr
        if n.numId is not None:
            num_id = n.numId.val
        if n.ilvl is not None:
            ilvl = n.ilvl.val
    lines.append(f"{i:3d} n={num_id} l={ilvl} | {t}")

Path(__file__).parent.joinpath("_compare_full.txt").write_text(
    "\n".join(lines), encoding="utf-8"
)
