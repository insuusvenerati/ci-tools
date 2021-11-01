module.exports = {
  branches: ['main', { name: 'develop', prerelease: true }],
  repositoryUrl: 'https://github.com/insuusvenerati/ci-tools',
  tagFormat: '${version}',
  plugins: [
    '@semantic-release/commit-analyzer',
    [
      '@semantic-release/changelog',
      {
        changelogFile: 'CHANGELOG.MD',
      },
    ],
    '@semantic-release/release-notes-generator',
    [
      '@semantic-release/github',
    ],
    [
      '@semantic-release/npm',
      {
        npmPublish: false,
      },
    ],
    [
      '@semantic-release/git',
      {
        assets: ['package.json', 'CHANGELOG.MD'],
        message: 'chore(release): [CI SKIP] ${nextRelease.version}\n\n${nextRelease.notes}',
      },
    ],
  ],
};
