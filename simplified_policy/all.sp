#line 1 "./simplified_policy/init_t.sp"
# SELinux Policy Editor, a simple editor for SELinux policies
# Copyright (C) 2006 Yuichi Nakamura

{
domain init_t;
domain_trans kernel_t /sbin/init;
include common-relaxed.sp;

allowpriv all;
allowtmp -dir /etc -name etc_runtime_t;
}
#line 1 "./simplified_policy/initrc_t.sp"
# SELinux Policy Editor, a simple editor for SELinux policies
# Copyright (C) 2006 Yuichi Nakamura

{
domain initrc_t;
domain_trans kernel_t /etc/init.d, /etc/rc.d/rc,/etc/rc.d/rc.sysinit,/etc/rc.d/rc.local;
domain_trans unconfined_t /etc/rc.d/init.d, /etc/init.d;
include common-relaxed.sp;
include daemon.sp;

allowtmp -dir /etc -name etc_runtime_t;
allowpriv all;
}
#line 1 "./simplified_policy/kernel_t.sp"
# SELinux Policy Editor, a simple editor for SELinux policies
# Copyright (C) 2006 Yuichi Nakamura

{
domain kernel_t;
include common-relaxed.sp;

allowpriv all;
}
#line 1 "./simplified_policy/syslogd_t.sp"
# SELinux Policy Editor, a simple editor for SELinux policies
# Copyright (C) 2006 Yuichi Nakamura

{
domain syslogd_t;
program /sbin/syslogd, /sbin/minilogd;

include common-relaxed.sp;
include daemon.sp;
include nameservice.sp;

allowcom -unix login_t r,w;
allow /etc/syslog.conf r,s;
allow /var/log/* r,w,s;
allowtmp -dir /dev -name dev_log_t r,w,s;
allow /etc/selinux/config r;
}
#line 1 "./simplified_policy/unconfined_ldconfig_t.sp"
# SELinux Policy Editor, a simple editor for SELinux policies
# Copyright (C) 2006 Yuichi Nakamura

{
# This domain is necessary to label ld.so.cache correctly.
domain unconfined_ldconfig_t;
program /sbin/ldconfig;
include common-relaxed.sp;

allowpriv all;
allowtmp -dir /etc -name ldconfig_cache_t r,w,s;
}
#line 1 "./simplified_policy/unconfined_t.sp"
# SELinux Policy Editor, a simple editor for SELinux policies
# Copyright (C) 2006 Yuichi Nakamura

{
domain unconfined_t;
program /bin/login;
include common-relaxed.sp;
include daemon.sp;

allowpriv all;
}
