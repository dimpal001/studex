import Image from 'next/image'
import HeroSection from './HomePageSections/HeroSection'
import FeatureSection from './HomePageSections/FeatureSection'
import HowItWorksSections from './HomePageSections/HowItWorksSections'
import OutSubjectsSection from './HomePageSections/OutSubjectsSection'
import ExamSection from './HomePageSections/ExamSection'
import JoinOurCommunitySection from './HomePageSections/JoinOurCommunitySection'
import OurPlansSection from './HomePageSections/OurPlansSection'
import TestimonialsSection from './HomePageSections/TestimonialsSection'
import DownloadAppSection from './HomePageSections/DownloadAppSection'

export default function Home() {
  return (
    <div className=''>
      <main className=''>
        <HeroSection />
        <FeatureSection />
        <HowItWorksSections />
        <OutSubjectsSection />
        <ExamSection />
        <JoinOurCommunitySection />
        <OurPlansSection />
        <TestimonialsSection />
        <DownloadAppSection />
      </main>
    </div>
  )
}
