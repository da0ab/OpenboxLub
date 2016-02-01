#!/bin/bash
 
 #- Wav nach Flac wandeln, Zusatz-Informationen(Interpret Titel)Tags schreiben. -#
 
 . output_format
 . dir_exists
 . basedir_name_basen
 . checkfor
 . remove_in_files
 
 flac_app="flac";
 metaflac_app="metaflac";
 media_file_ext="[fw][la][av]";
 wav_ext="wav";
 feldtrenner=" - "
 comment=`date +%Y.%m.%d`
 comment="T. ${comment}"
 
 #clear;
 
 dir_exists "${1}"
 checkfor "${flac_app}" "${metaflac_app}"
 
 encode_flac(){
 	echo -e "${red_bg}enc${ende1}-flac - ${red}${1}${ende1}"
 	flac -5 -f "${1}" "${2}" "${3}" "${5}" "${6}" "${7}" "${8}" -o "${4}"
 }
 
 set_flac_tags(){
 	echo -e "${red}set${ende1}-flac - ${red}${1}${ende1}"
 	metaflac "${2}" "${3}" "${5}" "${6}" "${7}" "${8}" "${1}"
 }
 
 wav2flac(){
 	find "${1}" -type f -iname "*${5}*" | while read audio_file; do 
 		basedir_name_basen "${audio_file}"
 		disc_artist=`echo "${dirup1}" | awk -F "${4}" '{ print $1 }'`
 		disc_title=`echo "${dirup1}" | awk -F "${4}" '{ print $2 }'`
 		disc_genre=`echo "${dirup1}" | awk -F "${4}" '{ print $3 }'`
 
 		number_artist=`echo "${basen}" | awk -F "${4}" '{ print $1 }'`
 		artist_title=`echo "${basen}" | awk -F "${4}" '{ print $2 }'`
 		title=`echo "${basen}" | awk -F "${4}" '{ print $3 }'`
 
 		if [[ "${ext}" =~ "wav" ]]; then
 			[ "`echo "${name}" | awk -F "${4}" '{ if($1 !~ /^[0-9][0-9]/) print NF ? NF-1 : 1}'`" == "1" ] && \
 			encode_flac "${audio_file}" --tag=Artist="${number_artist}" --tag=Title="${artist_title}" "${basedir}/${number_artist}${4}${artist_title}.${3}" --tag=Album="${disc_title}" --tag=Genre="${disc_genre}" --tag=Tracknumber="" --tag=Comment="${6}"
 
 			[ "`echo "${name}" | awk -F "${4}" '{ if($1 ~ /^[0-9][0-9]/) print NF ? NF-1 : 1}'`" == "1" ] && \
 			encode_flac "${audio_file}" --tag=Artist="${disc_artist}" --tag=Title="${artist_title}" "${basedir}/${number_artist}${4}${artist_title}.${3}" --tag=Album="${disc_title}" --tag=Genre="${disc_genre}" --tag=Tracknumber="${number_artist}" --tag=Comment="${6}"
 
 			[ "`echo "${name}" | awk -F "${4}" '{ if($1 ~ /^[0-9][0-9]/) print NF ? NF-1 : 2}'`" == "2" ] && \
 			encode_flac "${audio_file}" --tag=Artist="${artist_title}" --tag=Title="${title}" "${basedir}/${number_artist}${4}${artist_title}${4}${title}.${3}" --tag=Album="${disc_title}" --tag=Genre="${disc_genre}" --tag=Tracknumber="${number_artist}" --tag=Comment="${6}"
 		fi
 
 		if [[ "${ext}" =~ "flac" ]]; then
 			[ "`echo "${name}" | awk -F "${4}" '{ if($1 !~ /^[0-9][0-9]/) print NF ? NF-1 : 1}'`" == "1" ] && \
 			set_flac_tags "${audio_file}" --set-tag=Artist="${number_artist}" --set-tag=Title="${artist_title}" "${basedir}/${number_artist}${4}${artist_title}.${3}" --set-tag=Album="${disc_title}" --set-tag=Genre="${disc_genre}" --set-tag=Tracknumber="" --set-tag=Comment="${6}"
 
 			[ "`echo "${name}" | awk -F "${4}" '{ if($1 ~ /^[0-9][0-9]/) print NF ? NF-1 : 1}'`" == "1" ] && \
 			set_flac_tags "${audio_file}" --set-tag=Artist="${disc_artist}" --set-tag=Title="${artist_title}" "${basedir}/${number_artist}${4}${artist_title}.${3}" --set-tag=Album="${disc_title}" --set-tag=Genre="${disc_genre}" --set-tag=Tracknumber="${number_artist}" --set-tag=Comment="${6}"
 
 			[ "`echo "${name}" | awk -F "${4}" '{ if($1 ~ /^[0-9][0-9]/) print NF ? NF-1 : 2}'`" == "2" ] && \
 			set_flac_tags "${audio_file}" --set-tag=Artist="${artist_title}" --set-tag=Title="${title}" "${basedir}/${number_artist}${4}${artist_title}${4}${title}.${3}" --set-tag=Album="${disc_title}" --set-tag=Genre="${disc_genre}" --set-tag=Tracknumber="${number_artist}" --set-tag=Comment="${6}"
 		fi
 	done
 }
 
 wav2flac "${1}" "${wav_ext}" "${flac_app}" "${feldtrenner}" "${media_file_ext}" "${comment}"
 #remove_in_files "${1}" "${wav_ext}" "${flac_app}"
