#! /bin/bash

printf "   [0]   Dev -> Local\n"
printf "   [1] Stage -> Local\n"
printf "   [2]  Prod -> Local\n"
printf "   [3]   Dev -> Stage\n"
printf "   [4]   Dev -> Prod\n"
printf "   [5] Stage -> Dev\n"
printf "   [6] Stage -> Prod\n"
printf "   [7]  Prod -> Dev\n"
printf "   [8]  Prod -> Stage\n"
echo "Which rsync do you want to run?"
read Choice

if [ "${Choice}" -eq "0" ]; then
    rsync -avzh {%= server_user %}:/srv/dev_{%= domain_name %}_{%= domain_tld %}/public/media ./src

elif [ "${Choice}" -eq "1" ]; then
    rsync -avzh {%= server_user %}:/srv/stage_{%= domain_name %}_{%= domain_tld %}/public/media ./src

elif [ "${Choice}" -eq "2" ]; then
    rsync -avzh {%= server_user %}:/srv/{%= domain_name %}_{%= domain_tld %}/public/media ./src

elif [ "${Choice}" -eq "3" ]; then
    ssh {%= server_user %} << EOF
rsync -avzh /srv/dev_{%= domain_name %}_{%= domain_tld %}/public/media/ /srv/stage_{%= domain_name %}_{%= domain_tld %}/public/media
EOF

elif [ "${Choice}" -eq "4" ]; then
    ssh {%= server_user %} << EOF
rsync -avzh /srv/dev_{%= domain_name %}_{%= domain_tld %}/public/media/ /srv/{%= domain_name %}_{%= domain_tld %}/public/media
EOF

elif [ "${Choice}" -eq "5" ]; then
    ssh {%= server_user %} << EOF
rsync -avzh /srv/stage_{%= domain_name %}_{%= domain_tld %}/public/media/ /srv/dev_{%= domain_name %}_{%= domain_tld %}/public/media
EOF

elif [ "${Choice}" -eq "6" ]; then
    ssh {%= server_user %} << EOF
rsync -avzh /srv/stage_{%= domain_name %}_{%= domain_tld %}/public/media/ /srv/{%= domain_name %}_{%= domain_tld %}/public/media
EOF

elif [ "${Choice}" -eq "7" ]; then
    ssh {%= server_user %} << EOF
rsync -avzh /srv/{%= domain_name %}_{%= domain_tld %}/public/media/ /srv/dev_{%= domain_name %}_{%= domain_tld %}/public/media
EOF

elif [ "${Choice}" -eq "8" ]; then
    ssh {%= server_user %} << EOF
rsync -avzh /srv/{%= domain_name %}_{%= domain_tld %}/public/media/ /srv/stage_{%= domain_name %}_{%= domain_tld %}/public/media
EOF

else
    echo "Incorrect Selection"
fi
