# For bluetooth mac address loading
allow qti_init_shell efs_file:dir search;
allow qti_init_shell bluetooth_efs_file:dir search;
allow qti_init_shell bluetooth_efs_file:file r_file_perms;
allow qti_init_shell bluetooth_loader_exec:file r_file_perms;
allow qti_init_shell hci_attach_dev:chr_file rw_file_perms;

# Allow qmuxd
allow qti_init_shell qmuxd_socket:dir w_dir_perms;
allow qti_init_shell qmuxd:unix_stream_socket connectto;
allow qti_init_shell qmuxd_socket:sock_file { create write setattr };
