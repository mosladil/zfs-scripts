Name:		zsnap.pl
Description:	Create a weekly snapshot of a dataset by day name. Remove existing if already exists
Author:		Miroslav Osladil <xxlmira@gmail.com>

Put script to some admin place and add an entry to cron, e.g: 
	$ pfexec crontab -e root

Dataset is an argument:
	30 2 * * * /root/scripts/zsnap.pl rpool/data/mysql

Scripts creates following snapshots, e.g:
	NAME                               USED   AVAIL  REFER  MOUNTPOINT
	$ zfs list -t snapshot
	rpool/data/mysql@Mon               8.63M      -  93.4M  -
	rpool/data/mysql@Tue               7.63M      -  93.4M  -
	rpool/data/mysql@Wed               7.72M      -  93.4M  -
	rpool/data/mysql@Thu               7.23M      -  93.4M  -
	rpool/data/mysql@Fri               7.73M      -  93.4M  -
	rpool/data/mysql@Sat               7.01M      -  93.4M  -
	rpool/data/mysql@Sun               7.53M      -  93.4M  -
