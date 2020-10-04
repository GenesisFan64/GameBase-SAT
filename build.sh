clear
echo "** SATURN **"
tools/AS/linux/asl disc.asm -q -xx -c -A -olist out/rom_saturn.lst -A -L
python tools/p2bin.py disc.p out/rom_saturn.bin
rm disc.p
rm disc.h
