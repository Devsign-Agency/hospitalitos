export type DataTableType<T> = {
    columns: { title: string, field: keyof T, templateId?: string }[],
    actions: { label: string, actionIdToReturn: string, iconUrl: string, showOption: () => boolean }[]
}
