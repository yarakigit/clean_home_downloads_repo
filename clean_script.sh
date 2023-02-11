install_repo_path=".clean_home_downloads_repo"
settings_json_file_name="settings_clean_script.json"
settings_json=$HOME/$install_repo_path/$settings_json_file_name
Downloads_dir="Downloads"
browse=("Chrome" "Firefox")

chrome_user_num=`cat $settings_json | jq "[.Chrome[]] | length"`
chrome_user_num=$(($chrome_user_num - 1))
firefox_user_num=`cat $settings_json | jq "[.Firefox[]] | length"`
firefox_user_num=$(($firefox_user_num - 1))

chrome_user=()
firefox_user=()

for chrome_user_id in `seq 0 ${chrome_user_num}`; do
    chrome_user+=`cat $settings_json | jq -r ".Chrome[${chrome_user_id}]"`
done
for firefox_user_id in `seq 0 ${firefox_user_num}`; do
    firefox_user+=`cat $settings_json | jq -r ".Firefox[${firefox_user_id}]"`
done

echo  $chrome_user
echo $firefox_user

MacOS_flag=0
if [[ $OSTYPE = "darwin"* ]]; then
    MacOS_flag=1
fi

for browse_element in $browse; do
    if [ $browse_element = "Chrome" ];
    then
        for chrome_user_element in $chrome_user; do
            tmp_exe_file_dir=$HOME/$Downloads_dir/$browse_element/$chrome_user_element
            if [ -e $tmp_exe_file_dir ]; then
                echo "[log] rm file list Chrome"
                find $tmp_exe_file_dir -type f
                if [ $MacOS_flag -eq 1 ];then
                    find $tmp_exe_file_dir -type f | xargs -I {} rm {}
                else
                    find $tmp_exe_file_dir -type f | xargs -i rm {}
                fi
            fi
        done
    elif [ $browse_element = "Firefox" ];
    then
        for firefox_user_element in $firefox_user; do
            tmp_exe_file_dir=$HOME/$Downloads_dir/$browse_element/$firefox_user_element
            if [ -e $tmp_exe_file_dir ]; then
                echo "[log] rm file list Firefox"
                find $tmp_exe_file_dir -type f
                if [ $MacOS_flag -eq 1 ];then
                    find $tmp_exe_file_dir -type f | xargs -I {} rm {}
                else
                    find $tmp_exe_file_dir -type f | xargs -i rm {}
                fi
            fi
        done        
    fi
done    