# -*- coding: utf-8 -*-
from docx import Document
from docx.shared import Length
from pathlib import Path

built = Path(__file__).parent / "_all_processes_built.docx"
ref = Path(r"d:\work\REGISTER\2026\0726\300726\sf64avitoP2_список_процессов.docx")
template = Path(__file__).parent / "sf64avitoP2_template_p1_p6.docx"

def dump(path, label, start_marker="P1", end_marker="P2"):
    d = Document(path)
    lines = []
    capture = False
    for i, p in enumerate(d.paragraphs):
        t = p.text
        s = t.strip()
        if s.startswith(start_marker) and "—" in s:
            capture = True
        if capture and end_marker and s.startswith(end_marker) and "—" in s and start_marker != end_marker:
            break
        if not capture:
            continue
        pf = p.paragraph_format
        ind = pf.left_indent
        fi = pf.first_line_indent
        tabs = [tab.tab_stops for tab in []]
        # tab chars in text
        tab_count = t.count("\t")
        num = p._element.pPr.numPr if p._element.pPr is not None else None
        num_id = None
        ilvl = None
        if p._element.pPr is not None and p._element.pPr.numPr is not None:
            n = p._element.pPr.numPr
            if n.numId is not None:
                num_id = n.numId.val
            if n.ilvl is not None:
                ilvl = n.ilvl.val
        lines.append(
            f"{i:3d} tabs={tab_count} numId={num_id} ilvl={ilvl} "
            f"ind={ind} fi={fi} | {repr(t[:100])}"
        )
    out = Path(__file__).parent / f"_compare_{label}.txt"
    out.write_text("\n".join(lines), encoding="utf-8")
    return out

dump(template or ref, "p1_ref", "P1", "P2")
dump(built, "p7_built", "P7", "P8")
# also P1 from built for same file compare
dump(built, "p1_built", "P1", "P2")
print("done")
