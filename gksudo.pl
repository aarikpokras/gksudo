#!/usr/bin/perl
# subs
sub GTK_Dialog_Window_error
{
  $gtk_window_text=$_[0];
  system("zenity", "--error", "--text=${gtk_window_text}");
}
# $gtk_window_text may not work w/ zenity
sub GTK_Dialog_Window_password
{
  $gtk_window_text=$_[0];
  $gtk_window_title=$_[1];
  system("zenity", "--password", "--text=${gtk_window_text}", "--title=${gtk_window_title}");
}
sub GTK_pw_sudo_STDIN
{
  $gtk_window_title=$_[0];
  system("zenity --password --title=${gtk_window_title} | sudo -p \"\" -S @{ARGV}");
}
# main
if (scalar @ARGV == 0) {
  print("Please pass a command.\n");
}
elsif (scalar @ARGV > 0) {
  system("sudo", "-k");
  GTK_pw_sudo_STDIN("Permission Required");
  my $gtk_sys_errortext = "sudo threw an error";
#  print($gtk_sys_errortext);
  system("if [ \$(echo $?) -ne 0 ]; then zenity --error --text=\"${gtk_sys_errortext}\"; else exit 0; fi");
}
