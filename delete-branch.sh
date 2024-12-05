# Branches yang tidak akan dihapus
EXCLUDE_BRANCHES=("main")

# Ambil semua branch di remote repository
REMOTE_BRANCHES=$(git ls-remote --heads origin | awk '{print $2}' | sed 's|refs/heads/||')

# Loop untuk mengecek dan menghapus branch kecuali yang ada di EXCLUDE_BRANCHES
for branch in $REMOTE_BRANCHES; do
  if [[ ! " ${EXCLUDE_BRANCHES[@]} " =~ " ${branch} " ]]; then
    echo "Menghapus branch: $branch"
    git push origin --delete "$branch"
  else
    echo "Melewati branch: $branch"
  fi
done

echo "Selesai."

