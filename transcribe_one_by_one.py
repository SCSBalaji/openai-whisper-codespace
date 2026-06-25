#!/usr/bin/env python3
"""
Transcribe files one-by-one using the whisper CLI:
whisper <file> --model small --fp16 False --language English
"""

import argparse
import subprocess
from pathlib import Path

EXTS = {".mp4", ".mkv", ".mov", ".webm", ".mp3", ".wav", ".m4a"}

def gather_files(paths):
    files = []
    for p in paths:
        p = Path(p)
        if p.is_file():
            files.append(p)
        elif p.is_dir():
            for f in sorted(p.rglob("*")):
                if f.suffix.lower() in EXTS and f.is_file():
                    files.append(f)
    return files

def transcribe_file(path: Path, output_dir: Path):
    print(f"Transcribing: {path}")
    cmd = [
        "whisper",
        str(path),
        "--model", "small",
        "--fp16", "False",
        "--language", "English",
        "--output_dir", str(output_dir),
    ]
    subprocess.run(cmd, check=True)

def main():
    ap = argparse.ArgumentParser(description="Transcribe files one-by-one with whisper CLI")
    ap.add_argument("inputs", nargs="+", help="Files and/or directories to transcribe")
    ap.add_argument("--out", "-o", default="transcripts", help="Output directory")
    args = ap.parse_args()

    outdir = Path(args.out)
    outdir.mkdir(parents=True, exist_ok=True)

    files = gather_files(args.inputs)
    if not files:
        print("No audio/video files found.")
        return

    for f in files:
        try:
            transcribe_file(f, outdir)
        except subprocess.CalledProcessError as e:
            print(f"Error transcribing {f}: {e}")

if __name__ == "__main__":
    main()