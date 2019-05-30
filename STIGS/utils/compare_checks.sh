#/bin/bash
#########################################################################################
# Title: Compare Checks									#
# Author: Rolando R. Gabriana Jr.							#
# Purpose: This script was created to compare between a set of directory		#
# filled with STIG check files    							#
# Usage: compare_checks <source_file> <target_file>					#
# Assumptions:										#
# base_dir=/opt/STIGS <-- root folder	                                		#
# util_dir=$base_dir/utils <-- utilities folder						#
# guidance_dir=$base_dir/guidance/{apache,jre,psql,redhat} <-- guidance folder		#
# report_dir=$basedir/reports <-- reporting folder					#
# compare_dir=$report_dir/compare_dir <-- compare folder				#
# compare_file=$compare_dir/{V-*} <-- comparison report file per vulid			#
# config_dir=$base_dir/config <-- config folder						#
# check_script=$base_dir/stig_scripts/{rhel,apache,postgres}/{version}/checks/vulid	#
# stig_file=$base_dir/stig_scripts/{rhel,apache,postgres}/{version}/stig/{vulid}	#
#########################################################################################

# Directory check
#set -e
base_dir=/opt/STIGS
util_dir=$base_dir/utils
report_dir=$base_dir/reports
compare_dir=$report_dir/compare_dir
dir1=$1
dir2=$2

source /opt/STIGS/config/fonts.conf

if [[ ! -d $dir1 || ! -d $dir2 ]]
  then
    echo -e "$lredfont ${1} input or ${2} input are not directories.\nPlease verify your entries are correct. $resetfont"
    exit
fi

DIFF () {

diff --suppress-common-lines --suppress-blank-empty --ignore-tab-expansion --ignore-trailing-space --ignore-all-space --ignore-blank-lines --strip-trailing-cr $1 $2 

}

LOOP () {

shopt -s nocasematch

src=$1
target=$2
# Create list 
SOURCE_FILE_LIST=`find $src -type f`
# run a loop for every file found from source
for FILE_LIST in ${SOURCE_FILE_LIST}
  do
# isolate just the files
    NAME=`basename $FILE_LIST`
# isolate the directory
    DIR=`dirname $FILE_LIST`
# compare 
    echo -e "$yellowfont comparing $greenfont $FILE_LIST $redfont "$target"/"$NAME" $resetfont "
    if [[ -e "$target"/"$NAME" ]]
      then
        DIFF "$FILE_LIST" "$target"/"$NAME"
        echo -e "$lgreenfont"
        read -p "CONTINUE? (y/n)
        " x

          if [ -z ${x} ]
            then
              x='y'
          fi

          case $x in
            y|yes )
# find out what software the check is for 
              software_name=`echo -e $DIR | grep -o 'rhel\|postgres\|apache\|centos'`
              ver=`echo -e $DIR | cut -d/ -f6`
              check_dir="$base_dir/stig_scripts/$software_name/$ver/checks"
              mkdir -p $compare_dir/$software_name/$ver
              DIFF "$FILE_LIST" "$target"/"$NAME" > $compare_dir/$software_name/$ver/$NAME
                if [[ ! -e $check_dir/"$NAME".sh ]]
                  then
                    echo -e "$yellowfont NOTE:\n\tno check script has been created for $NAME $resetfont"
                else
                    echo -e "$redfont WARNING:\n\tA CHECK SCRIPT HAS BEEN CREATED FOR $NAME VERIFY THE SCRIPT IS STILL ACCURATE $resetfont"
                fi
              echo -e "$resetfont"
           ;;
           * )
             echo -e "$lyellowfont COMPARISON COMPLETE $resetfont"
             exit
           ;;
         esac
    else
      echo -e "$FILE_LIST is a new entry there are no matching "$target"/"$NAME" stig check" | tee $compare_dir/$software_name/$ver/$NAME
    fi
  done
shopt -u nocasematch
echo -e "$resetfont"

}

LOOP $dir1 $dir2
