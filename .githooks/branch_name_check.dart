import 'dart:io';

dynamic main() {
  final rootDir = Directory.current;
  final commitFile = File(rootDir.path + "/.git/HEAD");
  final commitBranchName = commitFile.readAsStringSync();

  final regExp = RegExp(
    r'ref: refs\/heads\/(ref|feat|fix|tdd|hotfix|chore)\/(EZRX|RXUAT)-[0-9]+-([0-9a-zA-Z._-]{10,})+$',
  );

  final valid = regExp.hasMatch(commitBranchName);
  if (!valid) {
    print('''👎 Auron is not happy with your branch name. 
   You should rename your branch to a valid name and try again. 
   Please check https://zuelligpharma.atlassian.net/wiki/spaces/EZRX/pages/133890113/Branch+Naming+Conventions for more details''');
    exitCode = 1;
  }
}
