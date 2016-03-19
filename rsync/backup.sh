#!/usr/bin/bash

function print_help {

	printf "Usage: Back up a directory to another location on your filesystem.\n"
	printf "Options:          \n"
	printf "\t-d [DIRECTORY]  Specify the destination where files will be backed up.\n"
	printf "\t-e [FILE]		  Location of an exclude-from file.\n"
	printf "\t-h              Print this help file.\n"
	printf "\t-i [FILE]		  Location of an include-from file.\n"
	printf "\t-r			  Run in dry-run mode. No changes will be made.\n"
	printf "\t-t [DIRECTORY]  Target directory that will be backed up.\n"

}

BACKUP_DIR=""
TARGET_DIR=""

EXCLUDE_FROM=
INCLUDE_FROM=

DRYRUN=false

printf "Started backup at %s.\n" "$(date)"
# Parse command line arguments
while getopts "d:e:hi:rt:v" opt; do
	case "$opt" in
		d)
			BACKUP_DIR="$OPTARG"
			printf "Backing up to %s.\n" "$BACKUP_DIR"
			;;
		e)
			EXCLUDE_FROM="$OPTARG"
			printf "Excluding files listed in %s.\n" "$OPTARG"
			;;
		h)
			print_help
			exit 0
			;;
		i)
			INCLUDE_FROM="$OPTARG"
			printf "Including files listed in %s.\n" "$OPTARG"
			;;
		r)
			DRYRUN=true
			printf "Running in dry run mode.\n"
			;;
		t)
			TARGET_DIR="$OPTARG"
			printf "%s will be backed up.\n" "$TARGET_DIR"
			;;
		\?)
			print_help
			exit 1
			;;
	esac
done

# Check validity of command line arguments
if [[ -z "$BACKUP_DIR" ]] || [[ ! -d "$BACKUP_DIR" ]]; then
	printf "\'%s\' is not a valid backup directory. Aborting.\n" "$BACKUP_DIR"
	exit 1
elif [[ -z "$TARGET_DIR" ]] || [[ ! -d "$TARGET_DIR" ]]; then
	printf "\'%s\' is not a valid backup directory. Aborting.\n" "$TARGET_DIR"
	exit 1
fi

# Set up flags for rsync
flags=
if [[ "$DRYRUN" == true ]]; then
	flags+='--dry-run '
fi
flags+="--info=MOUNT,DEL,SKIP,STATS "
flags+="--archive "
flags+="--delete "
flags+="--no-links "

if [[ -z "$EXCLUDE_FROM" ]]; then
	printf "No exclude file specified. Exclusions will not be made.\n"
elif [[ ! -e "$EXCLUDE_FROM" ]]; then
	printf "\'%s\' is not a valid include file. Aborting.\n" "$BACKUPRC"
	exit 1
else
	flags+="--exclude-from=$EXCLUDE_FROM "
fi

if [[ -z "$INCLUDE_FROM" ]]; then
	printf "No include file specified. Exclusions will not be made.\n"
elif [[ ! -e "$INCLUDE_FROM" ]]; then
	printf "\'%s\' is not a valid include file. Aborting.\n" "$BACKUPRC"
	exit 1
else
	flags+="--include-from=$INCLUDE_FROM "
fi

rsynccmd="rsync "
rsynccmd+="${flags} "
rsynccmd+="${excludes} "
rsynccmd+="${TARGET_DIR} ${BACKUP_DIR}"

printf "full command: $rsynccmd\n"

${rsynccmd}

printf "Completed backup at %s.\n" "$(date)"
printf "=========================================\n"


